
# _*_ coding:utf-8 _*_
require 'mechanize'
require 'net/http'

@proxyAry = Array.new
agent = Mechanize.new
agent.user_agent_alias = 'Windows Chrome'
page = agent.get('http://www.data5u.com/free/gnpt/index.shtml')
temp = page.search("//ul[@class='l2']")
temp.each do |elem|
  tempList = elem.css('li')
  #@proxyAry << tempList[3].text+"://"+tempList[0].text+":"+tempList[1].text
  @proxyAry << [tempList[0].text, tempList[1].text]
end
page = agent.get('https://www.baidu.com')
puts page.title
#puts @proxyAry
@proxyAry.each do |elem|
  begin
    agent.set_proxy(elem[0],elem[1])
    page = agent.get('https://www.baidu.com')
    puts page.title
  rescue Exception => e
    puts e.message
    puts e.backtrace.inspect
  end

end

#temp_page = page.link_with(href: /post/).click
#puts temp_page.body
