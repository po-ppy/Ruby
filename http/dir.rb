#-*- coding:UTF-8 -*-
require 'faraday'
require 'nokogiri'
conn = Faraday.new(:url => 'http://202.117.179.110')
response = conn.get do |req|
  req.url '/command.jsp'
  req.params['teacher'] = 'PxnEdZwsWLM'
end
puts response.body

#doc = Nokogiri::HTML(conn.get.body.force_encoding("utf-8"))
#tds = doc.xpath("//frame")
#tds = doc.xpath("//td")
#tds.delete_if do |item|
#  td.strip == ""
#end
#tds.each do |td|
#  puts td.text
  #if td["src"].include? "jsp"
  #  puts "202.117.179.110/#{td['src']}"
  #end
  #if(td.key?("name") && td.key?("src"))
  #  puts td.to_s
  #end
#end

#temp = tds[0]
#puts temp.parent
#puts "------------"
#puts temp.key?("name")
