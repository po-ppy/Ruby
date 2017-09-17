#! /bin/ruby
#_*_ coding:utf-8 _*_
require './config'
require 'mysql2'

#deviceid = gets.to_s.rstrip!

client = Mysql2::Client.new(:host => @host,:username => @user,:password => @password,:database => @bb)
#result = client.query("select * from sportdata where deviceid = 'A&G:#{deviceid}' order by datatimem desc limit 20")
result = client.query("select * from sportdata where deviceid = 'A&G:#{ARGV[0]}' order by datatimem desc limit 20")


puts "id\tdeviceid\tdatatimem\tdatatime\tsportx\tsporty\tsportz\tanglex\tangley\tanglez\tstate"
result.each do |row|
 # row.delete("id")
  row.each_value do |value|
    print "#{value.to_s} "
  end
  puts ""
  #file.puts 

  #puts row.to_a
end
