#! /bin/ruby
#_*_ coding:UTF-8 _*_ 
require "open-uri"
require 'net/http'

$StudentId = "YB5764489";
$PlanId = "ff";
$SchoolCode = "10712";

params = {} 

params["ZoneLng"]="108.072368",
params["ZoneLat"]= "34.28446",
params["ZoneRadius"]="35.0",
params["StartTime"]="startTime",
params["EndTime"]="endTime",
params["UserLng"]="108.072368",
params["UserLat"]="34.28446",
params["StudentId"]=$StudentId,
params["PlanId"]= $PlanId,
params["SchoolCode"]= $SchoolCode


uri = URI.parse("http://kqapp.nwsuaf.edu.cn/signing.ashx")

res = Net::HTTP.post_form(uri, params)  

#返回的cookie 

#puts res.header['set-cookie'] 

#返回的html body 

puts res.body