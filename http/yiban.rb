#-*- coding:UTF-8 -*-
require 'net/http'
require 'patron'
require 'faraday'
require 'nokogiri'
startTime = Time.now.strftime("%Y-%m-%d ")  + "17:00"
endTime = Time.now.strftime("%Y-%m-%d ") + "21:00"
planId = '8f503f100f2843a192de1416ca88a10b'
conn = Faraday.new(:url => 'http://kqapp.nwsuaf.edu.cn') do |f|
  f.adapter :patron do |session|
    session.max_redirects = 5
  end
end
#response = conn.get_response '/ybcheck1.aspx', { :model => 0,:token => "a"*32 , :xsid => 'YB5764489',:sch => '10712',:ts => Time.now.strftime("%H:%M:%S")}
#response = conn.get do |req|
#  req.url '/ybcheck1.aspx', :model => 0
#  req.params['token']= 'a'*32
#  req.params['xsid'] = 'YB5764489'
#  req.params['sch'] = '10712'
#  req.params['ts'] = Time.now.strftime("%H:%M:%S")
#end
  
#puts response.body
res = conn.post do |req|
  req.url '/signing.ashx'
  req.headers['Content-Type'] = 'application/json'
  req.body = "{ 'ZoneLng': 108.863027,'ZoneLat': 34.234227, 'ZoneRadius': 620,'StartTime':'#{startTime}','EndTime':'#{endTime}','UserLng':108.863027,'UserLat':34.234227,'StudentId':'YB5764489','PlanId':'#{planId}',SchoolCode':'10712'}"
end
puts res.body
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
