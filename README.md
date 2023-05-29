# rails-pycall-langchain

a Rails + Langchain example using pycall.rb

## Features

* Langchain ChatOpenAI
* Langchain RetrievalQAChain (using OpenAIEmbedding + FAISS vector store)
* Langchain Agents (using python_repl)
* Ruby OpenAI gem

## pycall.rb Example

/examples/


## Setup

Install Python 3:

`brew install python`

(記得開新的 Terminal，確認 which python3 有吃到剛裝的 python)

Install Python packages:

```
pip3 install openai
pip3 install langchain
pip3 install tiktoken
pip3 install pypdf
pip3 install faiss-cpu
```

2. Edit config/secrets.yml, Add your OpenAI API key

(OpenAI API 跟 ChatGPT 是分開付款的，要分別綁信用卡)

3. `bundle`
4. `rake db:migrate`

