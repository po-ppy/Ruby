#! C:\Ruby23-x64\bin\ruby -w
#_*_ coding:utf-8 _*_

require 'matrix'

max = Matrix.zero(6)

puts max
ary = [1,2,3,4,4,4]
hash = { :hello => "hello_hash" , :world => "world_hash" , "haha" => "hahah_hash"}

ary = ary - [1,2,3,4] 
puts ary.size
puts Float::MAX
#puts ary.index ary.max
puts "--------------------"
a = 100
b = 50
puts "#{a} and '#{b}'"
startTime = Time.now
puts startTime.strftime("%Y/%m/%d ")+"17:00"


