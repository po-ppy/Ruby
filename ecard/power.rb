#!/usr/bin/env ruby
#_*_ coding:utf-8 _*_
require 'watir'
require 'watir-get-image-content'
require 'mini_magick'
require 'rtesseract'
#MiniMagick.configure do |config|
#  config.whiny = false
#end
prefs = {
  download: {
    prompt_for_download: false,
    default_directory: '.'
  }
}

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
browser = Watir::Browser.new :chrome, options:{prefs:prefs}
def goto_amount(browser)
  browser.goto 'http://ecardapp.nwsuaf.edu.cn:8070/AutoPay/PowerFee/Index'
  until browser.text_field(id:'UserAccount').exists? do sleep 0.1 end
  #puts browser.span(id:'errorMsg').text
  #browser.link(text: /转账充值/).click
  browser.text_field(id:'UserAccount').set '44476'
  browser.text_field(id:'Password').set '888888'
  img = browser.image(id:'imgCheckCode')
  #img.save 'gg'
  #checkCode = parse_price(img.src)
  begin
    img.click
    sleep 0.1
    File.delete('temo.jpg') if File.exist?('temo.jpg')
    File.write('temo.jpg',img.to_png)
    sleep 0.1
    checkCode = parse_price('temo.jpg')
  end while !checkCode
  #puts checkCode
  browser.text_field(id:'CheckCode').set checkCode
  browser.button(id:'btnLogin').click
  #puts browser.title
  #puts browser.span(id:'errorMsg').text
end

begin
  goto_amount(browser)
end while browser.span(id:'errorMsg').text != ''
until browser.select_list(id:'buildnum').exists? do sleep 1 end
browser.select_list(id:'buildnum').select /北西10/
browser.text_field(id:'RoomNum').set '205'
browser.text_field(id:'Amount').set '0.1'
browser.text_field(id:'Password').set '888888'
browser.button(id:'btnPayPowerFee').click
until browser.alert.exists? do sleep(0.5) end
puts browser.alert.text
browser.close
