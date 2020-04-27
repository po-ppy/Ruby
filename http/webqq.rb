#_*_ coding:utf-8 _*_
require 'watir'
require 'watir-get-image-content'

browser = Watir::Browser.new
browser.goto 'https://web2.qq.com/'
#page = browser.iframe(name:'ptlogin')
sleep 1
img = browser.iframe(name:'ptlogin').image(id:'qrlogin_img')
puts img.src
File.delete('temp.jpg') if File.exist?('temp.jpg')
File.write('temo.jpg',img.to_png)
sleep 20
chat_list = browser.ul(id:'current_chat_list')
chat_list.each do |elem|
  puts elem.text
end
puts browser.title


