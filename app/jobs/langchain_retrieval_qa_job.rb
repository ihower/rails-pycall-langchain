class LangchainRetrievalQaJob < ApplicationJob

  def perform(message)
    respond_to(message) do |message|
      Document.get_qa( message.content )
    end
  end

end
