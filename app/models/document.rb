class Document < ApplicationRecord

  mount_uploader :doc, DocUploader


  before_create :update_doc_metadata

  def update_doc_metadata
    self.content_type = doc.file.content_type
    self.file_name = doc.file.original_filename
    self.file_size = doc.file.size
  end

  def self.get_qa(query)
    faiss_store = LangChain::VectorStores.FAISS
    embeddings = LangChain::Embeddings.OpenAIEmbeddings.new( openai_api_key: Rails.application.secrets.openai_api_key )

    db = faiss_store.load_local("faiss_index", embeddings)

    #docs = db.similarity_search(query)
    retriever = db.as_retriever()
    docs = retriever.get_relevant_documents(query)

    Rails.logger.info( docs )

    qa = LangChain::Chains.RetrievalQA.from_chain_type(llm: LangChain::ChatModels.ChatOpenAI.new( model_name: 'gpt-3.5-turbo', openai_api_key: Rails.application.secrets.openai_api_key ), chain_type: "stuff", retriever: retriever)
    qa.run(query)
  end

  def parse_and_index!
    # pip install pypdf
    # pip install docx2txt

    loader = if self.content_type == 'application/pdf'
              LangChain::DocumentLoaders.PyPDFLoader.new(self.doc.path)
             elsif self.content_type == 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
              LangChain::DocumentLoaders.Docx2txtLoader.new(self.doc.path)
             end

    text = loader.load()

    chunk_size = 500
    chunk_overlap = 0

    # pip install tiktoken
    text_splitter = LangChain::TextSplitter.RecursiveCharacterTextSplitter.from_tiktoken_encoder( chunk_size: chunk_size, chunk_overlap: chunk_overlap)

    self.update_column(:status, "splitting text")
    chunks = text_splitter.split_documents(text)

    embeddings = LangChain::Embeddings.OpenAIEmbeddings.new( openai_api_key: Rails.application.secrets.openai_api_key )

    faiss_store = LangChain::VectorStores.FAISS

    self.update_column(:status, "embedding into pinecone")

    db = faiss_store.from_documents(chunks, embeddings)

    begin
      # if file not existed:
      #   could not open faiss_index/index.faiss for reading: No such file or directory (PyCall::PyError)
      existing_db = faiss_store.load_local("faiss_index", embeddings)
      existing_db.merge_from(db)
      existing_db.save_local("faiss_index")
    rescue
      # for first time
      db.save_local("faiss_index")
    end

    self.update_column(:status, "finished indexing")
  end


end
