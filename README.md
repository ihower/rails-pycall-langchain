# rails-pycall-langchain

a Rails + Langchain Chatroom example using pycall.rb

langchain: https://github.com/hwchase17/langchain
pycall.rb: https://github.com/mrkn/pycall.rb
talk slide: https://ihower.tw/blog/archives/11596

## Features

* Langchain ChatOpenAI
* Langchain RetrievalQAChain (using OpenAIEmbedding + FAISS vector store) for PDF upload
* Langchain Agents (using python_repl)
* Ruby OpenAI gem

## Rails Background job

Using sucker_punch gem for demo purpose.
If possible, I would recommend using delayed_job gem: https://github.com/collectiveidea/delayed_job

## About pycall.rb

1. There're some pycall.rb example at /examples
2. Rails will load lib/lang_chain.rb

## Setup

1. Install Python 3:

`brew install python`

(Note: Open a new Terminal and make sure that which python3 has the newly installed python)

2. Install Python packages:

```
pip3 install openai
pip3 install langchain
pip3 install tiktoken
pip3 install pypdf
pip3 install faiss-cpu
```

3. Edit config/secrets.yml, Add your OpenAI API key
4. `bundle`
5. `rake db:migrate`
6. `rails s`

