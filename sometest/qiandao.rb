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
require 'json'

$StudentId = "YB5764485";#YB5764489
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

uri = URI('http://kqapp.nwsuaf.edu.cn/signing.ashx')
req = Net::HTTP::Post.new(uri.path)
req.set_form_data(postdata)

http = Net::HTTP.new(uri.hostname,uri.port)

response = http.request(req)

jjj = JSON.parse response.body
#puts response.body
if jjj['Success'] then
     puts jjj["Msg"]
     #msg = "echo #{jjj["Msg"]} | mutt #{emailAddr} -s #{Time.now}签到 "
     #system msg
else
     puts jjj["Msg"]
     #msg = "echo #{jjj["Msg"]} | mutt #{emailAddr} -s #{Time.now}签到 "
     #system msg
end

