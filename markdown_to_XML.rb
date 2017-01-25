require 'redcarpet'
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
end
end
markdown = Redcarpet::Markdown.new(Redcarpet::Render::IndesignXML, fenced_code_blocks: true )
file = File.open('spiewnik.md') 
cont = file.read
File.open('spiewnik.xml', 'w') do |f| 
  f.write("<root>\n")
  f.write(markdown.render(cont))
  f.write("</root>")
end
