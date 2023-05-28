class LangchainPlainJob < ApplicationJob

  def perform(message)
    respond_to(message) do |message|

      openai_chat = LangChain::ChatModels.ChatOpenAI.new( model_name: 'gpt-3.5-turbo', temperature: 0, openai_api_key: Rails.application.secrets.openai_api_key )
      openai_chat.call([LangChain::Schema.HumanMessage.new(content: message.content )]).content

    end
  end

end
