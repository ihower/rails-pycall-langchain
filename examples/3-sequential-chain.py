# https://python.langchain.com/en/latest/getting_started/getting_started.html


from langchain.prompts import PromptTemplate
from langchain.chat_models import ChatOpenAI
from langchain.chains import LLMChain
from langchain.chains import SimpleSequentialChain

llm = ChatOpenAI(temperature=0.9, openai_api_key="sk-your-key-here")

prompt = PromptTemplate(
    input_variables=["product"],
    template="What is a good name for a company that makes {product}?",
)

chain1 = LLMChain(llm=llm, prompt=prompt)
print(chain1.run("colorful socks"))

print("----------------------")

second_prompt = PromptTemplate(
    input_variables=["company_name"],
    template="Write a catchphrase for the following company: {company_name}",
)
chain2 = LLMChain(llm=llm, prompt=second_prompt)

overall_chain = SimpleSequentialChain(chains=[chain1, chain2], verbose=True)

final_answer = overall_chain.run("colorful socks")
print(final_answer)

