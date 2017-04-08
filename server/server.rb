require 'sinatra'
require 'json'

config = JSON.parse(File.open("config").read)
set :bind, config['ip']
set :port, config['port']

get '/' do
  send_file "index.html"
end
get '/p/' do
	File.open("proponowane.html", "w+") do |f|
	  f << '<!DOCTYPE html><html lang="en"><head><meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta name="viewport" content="width=device-width, initial-scale=1"><title>Śpiewnik Błękitnej XIV</title><link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"><link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"><style>a,abbr,acronym,address,applet,article,aside,audio,b,big,blockquote,body,canvas,caption,center,cite,code,dd,del,details,dfn,div,dl,dt,em,embed,fieldset,figcaption,figure,footer,form,h1,h2,h3,h4,h5,h6,header,hgroup,html,i,iframe,img,ins,kbd,label,legend,li,main,mark,menu,nav,object,ol,output,p,pre,q,ruby,s,samp,section,small,span,strike,strong,sub,summary,sup,table,tbody,td,tfoot,th,thead,time,tr,tt,u,ul,var,video{margin:0;padding:0;border:0;vertical-align:baseline}article,aside,details,figcaption,figure,footer,header,hgroup,main,menu,nav,section{display:block}body{line-height:1}ol,ul{list-style:none}blockquote,q{quotes:none}blockquote:after,blockquote:before,q:after,q:before{content:none}a:active,a:hover{outline:0}table{border-collapse:collapse;border-spacing:0}body{font-family:"Fira Mono",monospace;font-size:10pt}html{margin:30px;max-width:100%;width:600px}h1{display:none;font-size:1.4em;font-family:"Source Sans Pro",sans-serif;line-height:3.6em}code,pre{font-family:"Fira Mono",monospace;font-size:1em;background:0 0;color:inherit}html{margin-left:0;margin-right:0}i{position:fixed;right:30px}h2{padding-top:20px;padding-bottom:5px}.dark i{color:#839496}.dark{color:#657b83;background-color:#002b36}.light i{color:#657b83}.light{color:#839496;background-color:#fdf6e3}</style></head><body class="dark"><a class="scheme" href="#"><i class="fa fa-adjust fa-2x" aria-hidden="true"></i></a><div class="container"><div class="row"><div class="col-md-6 col-md-offset-3">' 
	end
	File.open("proponowane.html", "a+") do |f|
	  f << `awk -F '```' '{for (i=1; i<NF; i++) {OFS=c%2?"</code></pre>":FS; printf "%s%s", $i, OFS; c++} print $NF}' spiewnik.md | gsed 's/```/<\/h2><pre><code>/' | gsed 's/## /<h2>/' | gsed '/# /a <\/h1>' | gsed 's/# /<h1>/' >> generated/spiewnik.html`
	  f << '</div></div></div><script src="https://code.jquery.com/jquery-3.1.1.min.js"
	  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
	  crossorigin="anonymous"></script><script type="text/javascript">$(document).ready(function(){$(".scheme").click(function(){$("body").toggleClass("light")});});</script></body></html>'
	end
	send_file "proponowane.html"
end
post "/add" do
  puts params
  File.open("add.txt", "a") do |f|
    f << "## #{params["title"]}\n"
    f << "```\n#{params["text"]}\n```\n"
  end
end
