#_*_ coding:utf-8 _*_
require './config'
require 'mysql2'

deviceid = gets.to_s.rstrip!

client = Mysql2::Client.new(:host => @host,:username => @user,:password => @password,:database => @db)
file = File.new("sportdata_AG#{deviceid}.txt","w+")
result = client.query("select * from sportdata where deviceid = 'A&G:#{deviceid}' order by datatimem desc")


file.puts "id\tdeviceid\tdatatimem\tdatatime\tsportx\tsporty\tsportz\tanglex\tangley\tanglez\tstate"
result.each do |row|
 # row.delete("id")
  row.each_value do |value|
    file.print "#{value.to_s} "
  end
  file.puts " "
  #file.puts 

  #puts row.to_a
end
