# https://python.langchain.com/en/latest/getting_started/getting_started.html
require 'pycall'

ChatOpenAI = PyCall.import_module("langchain.chat_models").ChatOpenAI
AIMessage = PyCall.import_module("langchain.schema").AIMessage
HumanMessage = PyCall.import_module("langchain.schema").HumanMessage
SystemMessage = PyCall.import_module("langchain.schema").SystemMessage


llm = ChatOpenAI.new(temperature: 0,
                     model_name: "gpt-3.5-turbo",
                     openai_api_key: "sk-your-key-here")

messages = [
    SystemMessage.new(content: "You are a helpful assistant that translates English to French."),
    HumanMessage.new(content: "I love programming.")
]

puts( llm.call(messages) )
# -> AIMessage(content="J'aime programmer.", additional_kwargs={})