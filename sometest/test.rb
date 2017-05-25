#! /bin/ruby
#_*_ coding:UTF-8 _*_


file = File.new('test.txt','a+')
#file.puts "哈哈哈哈哈哈"
puts file.size
str = String.new(file.gets)
file.close
#puts "哈好好好"
puts str