require 'sinatra'
require 'json'

config = JSON.parse(File.open("config").read)
set :bind, config['ip']
set :port, config['port']

get '/*' do
  send_file "index.html"
end
post "/add" do
  File.open("add.md", "a") do |f|
    f << params["data"]
  end
end
