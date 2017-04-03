require 'sinatra'
require 'json'

config = JSON.parse(File.open("config").read)
set :bind, config['ip']
set :port, config['port']

get '/*' do
  send_file "index.html"
end
post "/add" do
  puts params
  File.open("add.md", "a") do |f|
    f << "## #{params["title"]}\n"
    f << "```\n#{params["text"]}\n```\n"
  end
end
