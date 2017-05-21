#! /bin/ruby
#_*_ coding:UTF-8 _*_
require 'net/ftp'

ftest = Net::FTP.new('202.117.179.110');
ftest.login
 
puts ftest.system
puts ftest.getdir
