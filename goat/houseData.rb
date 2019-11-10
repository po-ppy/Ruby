#!/usr/bin/env ruby
require './routerDevice'

connections = []

deviceNum = 9
doNum = 50

deviceNum.times do |i|
  temp = Device.new("R000#{i+1}")
  connections << temp
end

doNum.times do
  sleep(1)
  connections.each do |k|
    k.send_data(k.normal_data)
  end
end

connections.each(&:close_socket)

puts "#{doNum} times is ok!"
