#var obj = {
#                    ZoneLng: GlbVar.zone.GeoCenterLng,
#                    ZoneLat: GlbVar.zone.GeoCenterLat,
#                    ZoneRadius: GlbVar.zone.GeoRadius,
#                    StartTime: startTime,
#                    EndTime: endTime,
#                    UserLng: point.lng,
#                    UserLat: point.lat,
#                    StudentId: GlbVar.StudentId,
#                    PlanId: GlbVar.PlanId,
#                    SchoolCode: GlbVar.SchoolCode
#                };
#! /bin/ruby
#_*_ coding:UTF-8 _*_
require 'net/http'

kqurl = "http://kqapp.nwsuaf.edu.cn"
posturl = "/signing.ashx"
url = "http://kqapp.nwsuaf.edu.cn/signing.ashx"

$StudentId = "YB5764489";
$PlanId = "ff";
$SchoolCode = "10712";
postdata = Hash[
          "ZoneLng"=>"108.072368",
          "ZoneLat"=> "34.28446",
          "ZoneRadius"=>"35.0",
          "StartTime"=>"startTime",
          "EndTime"=>"endTime",
          "UserLng"=>"108.072368",
          "UserLat"=>"34.28446",
          "StudentId"=>$StudentId,
          "PlanId"=> $PlanId,
          "SchoolCode"=> $SchoolCode]

#postdata.each do |key,value|
#     puts "key:#{key},value#{value}"
#end

strdata = "ZoneLng=108.072368&ZoneLat=34.28446&ZoneRadius=35.0&StartTime=startTime&EndTime=endTime&UserLng=108.072368&UserLat=34.28446&StudentId=#{$StudentId}&PlanId=#{$PlanId}&SchoolCode=#{$SchoolCode}"
puts strdata

 #http = Net::HTTP.new(kqurl)

#response = http.request_post(posturl,strdata)
#
#puts response.body



