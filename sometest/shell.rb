#! /bin/ruby
#_*_ coding:UTF-8 _*_

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
          "SchoolCode"=> $SchoolCode
      ]

cmd = "echo #{postdata['ZoneLng']}"
system cmd


