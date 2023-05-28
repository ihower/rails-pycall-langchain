# https://python.langchain.com/en/latest/getting_started/getting_started.html
require 'pycall'

OpenAI = PyCall.import_module("langchain.llms").OpenAI

llm = OpenAI.new(temperature: 0.9,
                 model_name: "text-davinci-003",
                 openai_api_key: "sk-your-key-here")

text = "What would be a good company name for a company that makes colorful socks?"

puts llm.call(text) # 或是 puts llm.(text)
