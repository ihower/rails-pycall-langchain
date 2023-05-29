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

1. you should have Python3, and then

```
pip3 install openai
pip3 install langchain
pip3 install tiktoken
pip3 install pypdf
pip3 install faiss-cpu
```

2. Edit config/secrets.yml, Add your OpenAI key
3. `bundle`
4. `rake db:migrate`
