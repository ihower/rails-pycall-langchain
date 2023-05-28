# https://python.langchain.com/en/latest/modules/chains/examples/llm_math.html
require 'pycall'

OpenAI = PyCall.import_module("langchain").OpenAI
LLMMathChain = PyCall.import_module("langchain").LLMMathChain

llm = OpenAI.new(temperature: 0, openai_api_key: "sk-your-key-here")
llm_math = LLMMathChain.from_llm(llm, verbose: true)

llm_math.run("What is 13 raised to the .3432 power?")