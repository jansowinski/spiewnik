require 'nokogiri'

input = File.open('spiewnik.xml').read
obj = Nokogiri::XML(input)
obj.xpath('//song').xpath('//tytul').each do |item|
  puts item.content
end
