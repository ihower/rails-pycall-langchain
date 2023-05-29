# rails-pycall-langchain

a Rails + Langchain Chatroom example using pycall.rb

## Features

* Langchain ChatOpenAI
* Langchain RetrievalQAChain (using OpenAIEmbedding + FAISS vector store)
* Langchain Agents (using python_repl)
* Ruby OpenAI gem

## Rails Background job

Using sucker_punch gem for demo purpose.
If possible, I would recommend using delayed_job gem(https://github.com/collectiveidea/delayed_job)

## pycall.rb Example

There're some pycall.rb example at /examples

## Setup

1. Install Python 3:

`brew install python`

(注意: 記得開新的 Terminal，確認 which python3 有吃到剛裝的 python)

2. Install Python packages:

```
pip3 install openai
pip3 install langchain
pip3 install tiktoken
pip3 install pypdf
pip3 install faiss-cpu
```

3. Edit config/secrets.yml, Add your OpenAI API key

(注意: OpenAI API 跟 ChatGPT 是分開付款的，要分別綁信用卡)

4. `bundle`
5. `rake db:migrate`
6. `rails s`

