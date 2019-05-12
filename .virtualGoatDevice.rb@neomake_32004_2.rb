#!/usr/bin/env ruby
# _*_ coding:utf-8 _*_

require 'socket'

hostname = 'localhost'
port = 8888

s = TCPSocket.open(hostname, port)

500.times do |i| 
  sleep(0.1)
  s.puts "*C#R0001##{Time.now.to_i}345#0#SC0001*"
  s.puts "*D#R0001##{Time.now.to_i}345#56#78#1#1300#28#67#19#0"
end

s.close
