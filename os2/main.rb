#! /bin/ruby
$LOAD_PATH << '.'
require 'jobs'

#job1=Job.new("test1",10,"a","W",Time.now)
#job2=Job.new("test2",20,"b","W",Time.now)
puts "作业数："
jobNum = gets
puts <<EOF
	name,ntime,resource,status,intime
EOF

ary = Array.new

for i in (0...jobNum.to_i)  do 
	ary << Job.new(gets)
end
=begin
job1 = Job.new(gets)
job2 = Job.new(gets)
now = Time.now
ary << job1 << job2
=end
now = Time.now
puts <<EOF
作业名\t进入时间\t\t开始时间\t\t完成时间\t\t周转时间\t带权周转时间
EOF
ary.each do  |i|
	i.setstarttime = now
	now += i.j_ntime
	i.setendtime = now
	i.displayInfo
end


