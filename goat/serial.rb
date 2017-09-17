#_*_ coding:utf-8 _*_

require "rubygems"
require "serialport"

sp = SerialPort.new "/dev/ttyUSB0",115200

while true
  puts sp.readline
end
