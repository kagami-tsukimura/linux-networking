require 'sinatra'
require 'sinatra/reloader'
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
         message: 'Hello World!!!'
     }.to_json
   end
   get '/api/tasks' do
    client = connect

    result_set = client.query('SELECT id, title, created_at FROM tasks')
    tasks = result_set.map do |row|
    {
      id: row['id'],
      title: row['title'],
      createdAt: row['created_at']
    }
    end

client.close

       {
           tasks: tasks
       }.to_json
   end
   post '/api/tasks' do
    request_body = JSON.parse request.body.read

    client = connect

    statement = client.prepare('INSERT INTO tasks (title) VALUES (?)')
    statement.execute(request_body['title'])
    client.close
  end

  def connect
    Mysql2::Client.new(
      :host => 'introduction-to-docker_mysql_1', 
      :port => 3306, 
      :username => 'myuser', 
      :password => 'password', 
      :database => 'mydb',
      :connect_timeout => 5
    )
  end