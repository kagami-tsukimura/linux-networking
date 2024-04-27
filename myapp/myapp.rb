 require 'sinatra'
    get '/' do
      'Hello World!'
    end
    get '/test' do
      'Hello Test!'
    end
    get '/api/hello' do
      {
          message: 'Hello World!'
      }.to_json
    end