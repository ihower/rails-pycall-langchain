# https://python.langchain.com/en/latest/getting_started/getting_started.html
require 'pycall'

PromptTemplate = PyCall.import_module("langchain.prompts").PromptTemplate
ChatOpenAI = PyCall.import_module("langchain.chat_models").ChatOpenAI
LLMChain = PyCall.import_module("langchain.chains").LLMChain
SimpleSequentialChain = PyCall.import_module("langchain.chains").SimpleSequentialChain

llm = ChatOpenAI.new(temperature: 0.9, openai_api_key: "sk-your-key-here")

prompt = PromptTemplate.new(
    input_variables: ["product"],
    template: "What is a good name for a company that makes {product}?",
)

chain1 = LLMChain.new(llm: llm, prompt: prompt)
puts(chain1.run("colorful socks"))

print("----------------------")

second_prompt = PromptTemplate.new(
    input_variables: ["company_name"],
    template: "Write a catchphrase for the following company: {company_name}",
)
chain2 = LLMChain.new(llm: llm, prompt: second_prompt)

overall_chain = SimpleSequentialChain.new(chains: [chain1, chain2], verbose: true)

final_answer = overall_chain.run("colorful socks")
puts(final_answer)
