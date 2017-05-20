#! /bin/ruby
#_*_ coding: UTF-8 _*_

$LOAD_PATH << "."

require 'jobs'
require 'fun'


puts "作业数："
jobNum = gets
puts <<EOF
	name,ntime,resource,status,intime
EOF

ary = Array.new

for i in (0...jobNum.to_i)  do 
	ary << Job.new(gets)
end
$now = ary[0].j_intime
$now2 = ary[0].j_intime
$now3 = ary[0].j_intime


puts "先来先服务"
fcfs  = Fcfs.new(ary)
3.times do 
	Thread.new{	fcfs.run}
end
#some different
=begin
puts "SJF"
sjf = Sjf.new(ary)
sjf.run

puts "HRN"
hrn = Hrn.new(ary)
hrn.run

=end




