#!/usr/bin/env ruby

require 'socket'

# the virtual device.
class Device
  attr_accessor :id, :socket, :hostname, :port

  # new
  def initialize(id, hostname = 'localhost', port = 8888)
    @id = id
    @hostname = hostname
    @port = port
    @socket = TCPSocket.open(hostname, port)
  end

  # generate the data
  def normal_data
    # "*D##{@id}##{(Time.now.to_f*1000).to_i}#56#78#1#1300#28#67#19#0"
    "*D##{@id}##{(Time.now.to_f*1000).to_i}##{rand(80)}##{rand(80)}#1#1300#28#67#19#0"
  end

  # event data
  def event_data
    "*C##{@id}##{(Time.now.to_f*1000).to_i}##{rand(0..3)}#SC0001"
  end

  # send
  def send_data(str)
    @socket.puts str
  end

  def open_socket
    @socket.open(@hostname, @port)
  end

  def close_socket
    @socket.close
  end

end

connections = []

deviceNum = 30
doNum = 5

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

=begin
doNum.times do
  sleep 1
  connections.each do |k|
    k.send_data(k.event_data)
  end
end
=end

=begin
sendCount = 0
loop do
  sendCount += 1
  puts sendCount
  sleep(59)
  connections.each do |k|
    k.send_data(k.normal_data)
  end

  sleep 5
  connections.each do |k|
    k.send_data(k.event_data)
  end
  
end
=end

connections.each(&:close_socket)

puts "#{doNum} times is ok!"

# hostname = 'localhost'
# port = 8888

# s = TCPSocket.open(hostname, port)

# 500.times do |i| 
#   sleep(0.1)
#   s.puts "*C#R0001##{(Time.now.to_f*1000).to_i}#0#SC0001"
#   s.puts "*D#R0001##{(Time.now.to_f*1000).to_i}#56#78#1#1300#28#67#19#0"
# end

# s.close
