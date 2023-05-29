# https://python.langchain.com/en/latest/modules/agents/getting_started.html
require 'pycall'

Agents = PyCall.import_module("langchain.agents")

AgentType = PyCall.import_module("langchain.agents").AgentType
OpenAI = PyCall.import_module("langchain.llms").OpenAI

llm = OpenAI.new(temperature: 0, openai_api_key: 'sk-your-key-here')

tools = Agents.load_tools(["requests_all", "llm-math"], llm: llm)

agent = Agents.initialize_agent(tools, llm, agent: AgentType.ZERO_SHOT_REACT_DESCRIPTION, verbose: true)

agent.run("請去 https://ihower.tw/test.json 抓取 JSON，然後將 bar 的值乘上10是多少?")

# > Entering new AgentExecutor chain...

# Thought: I need to get the value of bar from the JSON file.
# Action: requests_get
# Action Input: https://ihower.tw/test.json
# Observation: { "foo": "bar", "bar": 123 }
#
# Thought: I need to multiply the value of bar by 10
# Action: Calculator
# Action Input: 123 * 10
# Observation: Answer: 1230
#
# Thought: I now know the final answer
# Final Answer: 1230
