class RubyOpenaiJob < ApplicationJob

  def perform(message)

    respond_to(message) do |message|

      client = OpenAI::Client.new(access_token: Rails.application.secrets.openai_api_key)
      response = client.chat(
        parameters: {
          model: 'gpt-3.5-turbo',
          messages: [{ role: "user", content: message.content }],
          temperature: 0.7,
      })
      response.dig("choices", 0, "message", "content")

    end

  end

end
