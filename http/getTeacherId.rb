# _*_ coding:utf-8 _*_
require 'mechanize'
require 'net/http'

agent = Mechanize.new
agent.user_agent_alias = 'Windows Chrome'
page = agent.get('http://202.117.179.110')
page = page.frame_with(name: 'teacher').click
list = page.xpath("//td/a")
puts "# _*_ coding:utf-8 _*_"
puts "@teacher={"
list.each do |elem|
  puts "'#{elem.text}' => '#{elem['href'].split('=')[1]}',"
end
puts "}"
#puts list

#temp_page = page.link_with(href: /post/).click
#puts temp_page.body
