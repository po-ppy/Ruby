# _*_ coding:utf-8 _*_
require 'mechanize'
require 'net/http'
require './name_ybid'

#name_ybid = {'姓名' => 'ybid'}
def sign(name_id_hash)
  name_id_hash.each do |key,value|
    agent = Mechanize.new
    page = agent.get('http://kqapp.nwsuaf.edu.cn/ybcheck1.aspx?model=0&xsid='+value+'&sch=10712&token=1ea5edf1b56993f18c2ce93f5aaacd3ad9fd4c75&ts='+Time.now.to_i.to_s+'345')
    planId = page.body.match(/GlbVar\.PlanId=.*;/).to_s.split("'")[1]
    zoneLng = page.body.match(/GlbVar\.zone.*Lng.*;/).to_s.split("=")[1].chop.to_f
    zoneLat = page.body.match(/GlbVar\.zone.*Lat.*;/).to_s.split("=")[1].chop.to_f
    zoneRadius = page.body.match(/GlbVar\.zone.*Radius.*;/).to_s.split("=")[1].chop.to_f
    startTime = page.body.match(/GlbVar\.StartTime.*;/).to_s.split("'")[1]
    endTime = page.body.match(/GlbVar\.EndTime.*;/).to_s.split("'")[1]
    #测试数据是否正确
    #puts "zoneLng: #{zoneLng}"
    #puts "zoneLat: #{zoneLat}"
    #puts "zoneRadius: #{zoneRadius}"
    #puts "startTime: #{startTime}"
    #puts "endTime: #{endTime}"
    

    #puts page.body
    
    if planId.size == 32
      uri = URI('http://kqapp.nwsuaf.edu.cn/signing.ashx')
        params = Hash['ZoneLng'=>zoneLng, 'ZoneLat'=>zoneLat, 'ZoneRadius'=>zoneRadius,'StartTime'=>startTime,'EndTime'=>endTime ,'UserLng'=>zoneLng,'UserLat'=>zoneLat,'StudentId'=>value,'PlanId'=>planId,'SchoolCode'=>'10712']
#
        res = Net::HTTP.post_form(uri,params)
        puts "#{key}的签到返回结果如下："
        puts res.body
    elsif planId == ''
      puts "不需要签到"
      puts res.body
      break
    else
      puts "PlanId.size != 32  !!!!!!!!!!!"
      break
    end
  end
end

#待实战测试
sign(@name_ybid)
