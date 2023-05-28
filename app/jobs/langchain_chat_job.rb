class LangchainChatJob < ApplicationJob

  def perform(message)
    respond_to(message) do |message|

      openai_chat = LangChain::ChatModels.ChatOpenAI.new( model_name: 'gpt-3.5-turbo', temperature: 0, openai_api_key: Rails.application.secrets.openai_api_key )

      arr = message.conversation.messages.order("id").map do |m|
        if m.role == 'user'
          LangChain::Schema.HumanMessage.new(content: m.content )
        else
          LangChain::Schema.AIMessage.new(content: m.content )
        end
      end

      openai_chat.call(arr).content

    end
  end

end
