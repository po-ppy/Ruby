#!/usr/bin/env ruby
#_*_ coding:utf-8 _*_
require 'mechanize'
require 'mini_magick'
require 'rtesseract'
def parse_price(price_url)  
  img = MiniMagick::Image.open(price_url)  
  img.resize '150%x150%'   # 放大  
  #img.resize '156x54'   # 放大  
  img.colorspace("GRAY") # 灰度化    
  #img.monochrome         # 去色  
  #str = RTesseract.new(img.path, options: :digits).to_s # 识别  
  #img.write 'temp.jpg'
  #puts img.path
  str = RTesseract.new(img.path,options: :digits).to_s # 识别  
  #str = RTesseract.new(img.path, :processor => "mini_magick") # 识别  
  #str = str.to_s
  #puts "str = #{str}%%%%%%%%"
  File.unlink(img.path)  # 删除临时文件  
  if str.nil?  
    #puts price_url  
    reurn nil
  else  
    price = str.strip.sub(/Y/,'')
    if /\d{4}/.match(price) then
      return price
    else
      return nil
    end 
    #price = str
    #puts "price = #{price}%%%%%%"
    #return price
  end  
end  
  
#parse_price ARGV[0]
#
@agent = Mechanize.new
begin
  File.delete('temo')
  @page = @agent.get('http://ecardapp.nwsuaf.edu.cn:8070/SynCard/Manage/Transfer')
  puts @page.title
  @form = @page.forms.first
  img = @page.image_with(id:'imgCheckCode')
  img.fetch.save('temo')
  @checkCode = parse_price('temo')
end while !@checkCode
puts @checkCode
@form.field_with(id:'UserAccount').value = '44476'
@form.field_with(id:'Password').value = '888888'
#@page = @form.field_with(id:'btnLogin').click
newpage = @form.click_button(@form.buttons.first)

puts newpage.title
