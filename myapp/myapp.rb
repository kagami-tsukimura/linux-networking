require 'sinatra'
require 'mysql2'

tasks = [
  ]

   get '/' do
     'Hello World!'
   end
   get '/test' do
     'Hello Test'
   end
   get '/api/hello' do
     {
         message: 'Hello World!'
     }.to_json
   end
   get '/api/tasks' do
       {
           tasks: tasks
       }.to_json
   end
   post '/api/tasks' do
    request_body = JSON.parse request.body.read

    task = {
      title: request_body['title'],
      createdAt: Time.now
    }
    tasks.push task
    
    task.to_json
  end

  def connect
    Mysql2::Client.new(
      :host => 'localhost', 
      :port => 3306, 
      :username => 'myuser', 
      :password => 'password', 
      :database => 'mydb',
      :connect_timeout => 5
    )
  end