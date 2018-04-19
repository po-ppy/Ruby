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
    #planId = '12345678123456781234567812345678'
    
    if planId.size == 32
      uri = URI('http://kqapp.nwsuaf.edu.cn/signing.ashx')
        params = ['ZoneLng'=>'108.07843700000', 'ZoneLat'=>'34.29188800000', 'ZoneRadius'=>'620.00','StartTime'=>Time.now.strftime("%Y%m%d")+' 17:00','EndTime'=>Time.now.strftime("%Y%m%d")+' 19:30' ,'UserLng'=>'108.07844700000','UserLat'=>'34.29189800000','StudentId'=>value,'PlanId'=>planId,'SchoolCode'=>'10712']
        #params = ['ZoneLng'=>'108.07843700000', 'ZoneLat'=>'34.29188800000', 'ZoneRadius'=>'620.00','StartTime'=>Time.now.strftime("%Y%m%d")+' 17:00','EndTime'=>Time.now.strftime("%Y%m%d")+' 19:30' ,'UserLng'=>'108.07844700000','UserLat'=>'34.29189800000','StudentId'=>value,'PlanId'=>planId,'SchoolCode'=>'10712']
        puts "#{key}的签到返回结果如下："
        res = Net::HTTP.post_form(uri,params)
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
