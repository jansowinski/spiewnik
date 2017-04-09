require 'redcarpet'
# change this to your adobe script path:
adobe_script_path = '/Users/janko/Library/Preferences/Adobe\ InDesign/Version\ 8.0/en_US/Scripts/Scripts\ Panel'

module Redcarpet
  module Render
    class IndesignXML < Base
      def block_code(code, lang)
        "<text>#{code}</text>\n</song>\n<Pagebreak></Pagebreak>"
      end
      def header(title, level)
        case level 
        when 1
          "<file_title>#{title}\n</file_title>\n"
        when 2
          "<song>\n<tytul>#{title}\n</tytul>\n"
        end
      end
    end
    class Json < Base
      def block_code(code, lang)
        "\"text\":\"#{code.gsub(/\n/, "\\n").gsub('"','\"').gsub("'","\\'")}\"},\n"
      end
      def header(title, level)
        case level 
        when 1
          ""
        when 2
          "{\"title\":\"#{title}\","
        end
      end
    end
  end
end

if ARGV.include?("-w")
  warning = ""
else
  warning = ">/dev/null"
end

system("cp scripts/PageBreaks.js #{adobe_script_path}")
system("mkdir -p generated")
puts "Generating XML..."
xml = Redcarpet::Markdown.new(Redcarpet::Render::IndesignXML, fenced_code_blocks: true )
file = File.open('spiewnik.md') 
cont = file.read
style = `node scripts/minify.js`
File.open('generated/spiewnik.xml', 'w') do |f| 
  f.write("<root>\n")
  f.write(xml.render(cont))
  f.write("</root>")
end
puts "Generating JSON..."
json = Redcarpet::Markdown.new(Redcarpet::Render::Json, fenced_code_blocks: true )
File.open('generated/spiewnik.json', 'w') do |f| 
  f.write(json.render(cont))
end

puts "Generating HTML..."
html = Redcarpet::Markdown.new(Redcarpet::Render::HTML, fenced_code_blocks: true )
File.open('generated/spiewnik.html', 'w') do |f|
  f.write('<!DOCTYPE html><html lang="en"><head><meta charset="utf-8"><meta http-equiv="X-UA-Compatible" content="IE=edge"><meta name="viewport" content="width=device-width, initial-scale=1"><title>Śpiewnik Błękitnej XIV</title><link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"><link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"><style>'+style+'</style></head><body class="dark"><a class="scheme" href="#"><i class="fa fa-adjust fa-2x" aria-hidden="true"></i></a><div class="container"><div class="row"><div class="col-md-6 col-md-offset-3">')
  f.write(html.render(cont))
  f.write('</div></div></div><script src="https://code.jquery.com/jquery-3.1.1.min.js"
  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
  crossorigin="anonymous"></script><script type="text/javascript">$(document).ready(function(){$(".scheme").click(function(){$("body").toggleClass("light")});});</script></body></html>')
end
system("cp generated/spiewnik.html server/")
if ARGV.include?("-e")
  File.open('generated/spiewnik.txt', 'w+') do |f|
    f << "\% Śpiewnik\n% Błękitna Czternastka\n\n"
    File.readlines("spiewnik.md").each do |s|
      f << s.gsub("##", "#").gsub("# Śpiewnik", "")
    end
  end
  puts "Generating EPUB..."
  system("cd generated && pandoc spiewnik.txt -o spiewnik.epub #{warning} && rm spiewnik.txt")
  puts "Generating MOBI..."
  system("cd generated && kindlegen spiewnik.epub #{warning}")
end
puts "DONE 🎶"
