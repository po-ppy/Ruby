#-*- coding:UTF-8 -*-
require 'faraday'
require 'nokogiri'
conn = Faraday.new(:url => 'http://www.nokogiri.org/tutorials/installing_nokogiri.html')
#response = conn.get
#puts response.body.inspect

doc = Nokogiri::HTML(conn.get.body.force_encoding("utf-8"))
puts "### Search for nodes by css"
doc.css('nav ul.menu li a', 'article h2').each do |link|
          puts link.content
end

puts "### Search for nodes by xpath"
doc.xpath('//nav//ul//li/a', '//article//h2').each do |link|
          puts link.content
end

puts "### Or mix and match."
doc.search('nav ul.menu li a', '//article//h2').each do |link|
          puts link.content
end
#tds = doc.xpath("//frame")
#tds = doc.xpath("//td")
#tds.delete_if do |item|
#  td.strip == ""
#end
#tds.each do |td|
#  puts td.text
#  #if td["src"].include? "jsp"
#  #  puts "202.117.179.110/#{td['src']}"
#  #end
#  #if(td.key?("name") && td.key?("src"))
#  #  puts td.to_s
#  #end
#end
#
##temp = tds[0]
##puts temp.parent
##puts "------------"
##puts temp.key?("name")
