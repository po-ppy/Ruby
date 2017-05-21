#! /bin/ruby
# _*_ coding: UTF-8 _*_
require 'net/http'
Net::HTTP.version_1_2
Net::HTTP.start('202.117.179.110',80){ |http|
	response = http.get('/ListDir.jsp')
	puts response.body
}
