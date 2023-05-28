class LangchainAgentReplJob < ApplicationJob

  def perform(message)

    respond_to(message) do |message|
      llm = LangChain::ChatModels.ChatOpenAI.new( model_name: 'gpt-3.5-turbo', temperature: 0, openai_api_key: Rails.application.secrets.openai_api_key)
      tools = LangChain::Agents.load_tools(["python_repl"], llm: llm)
      agent = LangChain::Agents.initialize_agent(tools, llm, agent: LangChain::Agents.AgentType.ZERO_SHOT_REACT_DESCRIPTION, verbose: true)

      agent.run(message.content)
    end

  end

end
