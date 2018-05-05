#_*_ coding:utf-8 _*_
require 'mini_magick'
require 'rtesseract'

#img = MiniMagick::Image.new("au.jpg")
#img.crop("#{img[:width] - 2}x#{img[:height] - 2}+1+1")
#img.colorspace("GRAY")
#image = RTesseract.new(img.path)
#image = RTesseract.new("au2.png")
#puts image
def parse_price(price_url)  
  img = MiniMagick::Image.open(price_url)  
  img.resize '200x100'   # 放大  
  img.colorspace("GRAY") # 灰度化    
  #img.monochrome         # 去色  
  #str = RTesseract.new(img.path, options: :digits).to_s # 识别  
  str = RTesseract.new(img.path).to_s # 识别  
  #str = RTesseract.new(img.path, processor: "mini_magick") # 识别  
  #str = str.to_s
  puts "str = #{str}%%%%%%%%"
  File.unlink(img.path)  # 删除临时文件  
  if str.nil?  
    puts price_url  
  else  
    price = str.strip.sub(/Y/,'')
    puts "price = #{price}%%%%%%"
  end  
end  
  
#调用：  
  
#parse_price('au5.jpg')  
#parse_price('au2.png')  
parse_price ARGV[0]

#def parse_dig(dig_url)  
#  img = MiniMagick::Image.open(dig_url)  
#  img.resize '200x100'   # 放大  
#  img.colorspace("GRAY") # 灰度化    
#  #img.monochrome         # 去色  
#  str = RTesseract.new(img.path, options: :digits).to_s # 识别  
#  #str = RTesseract.new(img.path, processor: "mini_magick") # 识别  
#  #str = str.to_s
#  puts "str = #{str}%%%%%%%%"
#  File.unlink(img.path)  # 删除临时文件  
#  if str.nil?  
#    puts dig_url  
#  else  
#    dig = str.strip.sub(/Y/,'')
#    puts "dig = #{dig}%%%%%%"
#  end  
#end  
#  
##调用：  
#  
##parse_dig('au.jpg')  
#parse_dig('au4.jpg')
#
