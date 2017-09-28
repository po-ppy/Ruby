# _*_ coding:utf-8 _*_
require 'socket'

server = TCPServer.new 2000
loop do
  client = server.accept
  while line = client.gets.strip
    puts line
    client.puts "your info is #{line}"
  end
  client.close
end
