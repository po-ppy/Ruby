#-*- coding:UTF-8 -*-
require 'faraday'
require 'nokogiri'
conn = Faraday.new(:url => 'http://202.117.179.110/ListTeacher.jsp')
#response = conn.get
#puts response.body.inspect

doc = Nokogiri::HTML(conn.get.body.force_encoding("utf-8"))
#tds = doc.xpath("//frame")
as = doc.xpath("//td/a")
as.each do |a|
  if a.key?("href")
    puts "#{a.text} : #{a["href"].split("=")[1]}"
  end
  #puts td.text
  #if td["src"].include? "jsp"
  #  puts "202.117.179.110/#{td['src']}"
  #end
  #if(td.key?("name") && td.key?("src"))
  #  puts td.to_s
  #end
end

#temp = tds[0]
#puts temp.parent
#puts "------------"
#puts temp.key?("name")
