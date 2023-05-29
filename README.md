# rails-pycall-langchain

a Rails + Langchain example using pycall.rb

## pycall.rb Example

/examples/


## Setup

### 安裝 python3

```
brew install python

# 可能需要先執行一次 python3 在 exit() ?
python3

pip3 install langchain
pip3 install tiktoken
pip3 install pypdf
pip3 install faiss-cpu
```

1. `cp config/secrets.yml.example config/secrets.yml`
2. Edit config/secrets.yml, Add your OpenAI key
3. `bundle`
4. `rake db:migrate`
