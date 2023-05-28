# https://python.langchain.com/en/latest/modules/chains/examples/llm_requests.html
require 'pycall'

OpenAI = PyCall.import_module("langchain.llms").OpenAI
LLMRequestsChain = PyCall.import_module("langchain.chains").LLMRequestsChain
LLMChain = PyCall.import_module("langchain.chains").LLMChain
PromptTemplate = PyCall.import_module("langchain.prompts").PromptTemplate

template = <<-EOF
Between >>> and <<< are the raw search result text from google.
Extract the answer to the question '{query}' or say "not found" if the information is not contained.
Use the format
Extracted:<answer or "not found">
>>> {requests_result} <<<
Extracted:
EOF

PROMPT = PromptTemplate.new(
    input_variables: ["query", "requests_result"],
    template: template,
)

llm = OpenAI.new(temperature: 0, openai_api_key: "sk-your-key-here")

chain = LLMRequestsChain.new(llm_chain: LLMChain.new(llm: llm, prompt: PROMPT) )

question = "What are the Three (3) biggest countries, and their respective sizes?"
inputs = {
    "query": question,
    "url": "https://www.google.com/search?q=" + question.gsub(" ", "+")
}

puts chain.run(inputs)
