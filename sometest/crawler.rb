#! /bin/ruby
# _*_ coding: UTF-8 _*_
require 'net/http'
Net::HTTP.version_1_2
Net::HTTP.start('202.117.179.110',80){ |http|
	#response = http.get('/ListDir.jsp')
	#response = http.post('/ListDir.jsp','Dir=4mu_CCmUlhiUFpPtm27GqOx85erzCU4qsWVHPKa1DQ4')
	#Download.jsp?FileName=4mu_CCmUlhiUFpPtm27GqOx85erzCU4qJYtItjQTbNmNsnFDIcAzB6JakitYebcS-7QIMzFuCmcVFv5YzCPKPtbA61FQzmfIhPOC96lDHz7gpoINPR1tRA
	response = http.post('/Download.jsp','FileName=4mu_CCmUlhiUFpPtm27GqOx85erzCU4qJYtItjQTbNmNsnFDIcAzB6JakitYebcS-7QIMzFuCmcVFv5YzCPKPtbA61FQzmfIhPOC96lDHz7gpoINPR1tRA')
	#puts response.body
	file = File.new('test.doc','w')
	file.write response.body
}
