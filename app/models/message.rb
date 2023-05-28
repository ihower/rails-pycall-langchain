class Message < ApplicationRecord

  PROCESSING_JOBS = {
    "langchain_plain" => "Python LangChain",
    "langchain_chat" => "Python LangChain 記憶完整對話",
    "langchain_agent_repl" => "Python LangChain + 工具 Python REPL",
    "langchain_retrieval_qa" =>  "Python LangChain + Retrieval QA",
    "ruby_openai" => "Ruby OpenAI gem",
  }

  belongs_to :conversation

end
