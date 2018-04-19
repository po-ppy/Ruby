#! /bin/ruby
# _*_ coding: UTF-8 _*_
$LOAD_PATH << '.'
require 'jobs'
$now = Time.now
$now2 = Time.now
$now3 = Time.now
class Fcfs

	def initialize(ary)
		@ary = ary.compact
	end
	def run
		now = Time.now
		avg1 = 0
		avg2 = 0
		puts <<EOF
作业名\t进入时间\t\t开始时间\t\t完成时间\t\t周转时间\t带权周转时间
EOF
		@ary.each do  |i|
			i.setstarttime = now
			now += i.j_ntime
			i.setendtime = now
			avg1 += i.j_endtime - i.j_intime
			avg2 += (i.j_endtime - i.j_intime)/(i.j_endtime - i.j_starttime)
			i.displayInfo
		end
		avg1 /=@ary.size.to_f
		avg2 /=@ary.size.to_f
		puts "平均周转时间：#{avg1}\t平均带权周转时间：#{avg2}"
	end
end

class Sjf
	def initialize(ary)
		@ary = ary.compact
	end
	def run
		
		jobNum = @ary.size
		avg1 = 0
		avg2 = 0
		puts <<EOF
作业名\t进入时间\t\t开始时间\t\t完成时间\t\t周转时间\t带权周转时间
EOF
			temp = @ary.shift
			temp.setstarttime = $now2
			$now2 += temp.j_ntime
			temp.setendtime = $now2
			temp.displayInfo
			avg1 += temp.j_endtime - temp.j_intime
			avg2 += (temp.j_endtime - temp.j_intime)/(temp.j_endtime - temp.j_starttime)
		while !@ary.empty?
			@ary.sort!{
				|a,b|
				a.j_ntime <=> b.j_ntime
				#if (b.j_intime > a.j_intime) then
				#	 a.j_ntime<=> (b.j_intime-a.j_intime)
				#elsif (a.j_status == "W" && b.j_status == "W") then
				#	a.j_ntime <=> b.j_ntime
				#end

			}
			
			temp = @ary.shift
			temp.setstarttime = $now2
			$now2 += temp.j_ntime
			temp.setendtime = $now2
			temp.displayInfo
			avg1 += temp.j_endtime - temp.j_intime
			avg2 += (temp.j_endtime - temp.j_intime)/(temp.j_endtime - temp.j_starttime)
		end

		avg1 /=jobNum.to_f
		avg2 /=jobNum.to_f
		puts "平均周转时间：#{avg1}\t平均带权周转时间：#{avg2}"
	end
end

class Hrn
	def initialize(ary)
		@ary = ary.compact
	end
	def run
		jobNum = @ary.size
		avg1 = 0
		avg2 = 0
		puts <<EOF
作业名\t进入时间\t\t开始时间\t\t完成时间\t\t周转时间\t带权周转时间
EOF
			temp = @ary.shift
			temp.setstarttime = $now3
			$now3 += temp.j_ntime
			temp.setendtime = $now3
			temp.displayInfo
			avg1 += temp.j_endtime - temp.j_intime
			avg2 += (temp.j_endtime - temp.j_intime)/(temp.j_endtime - temp.j_starttime)
		while !@ary.empty?
			@ary.sort!{
				|a,b|
				($now3-b.j_intime+b.j_ntime)/b.j_ntime<=>($now3-a.j_intime+a.j_ntime)/a.j_ntime 
				#if (b.j_intime > a.j_intime) then
				#	 a.j_ntime<=> (b.j_intime-a.j_intime)
				#elsif (a.j_status == "W" && b.j_status == "W") then
				#	a.j_ntime <=> b.j_ntime
				#end

			}
=begin
			@ary.each do |k|
				puts k.j_name
				puts ($now-k.j_intime+k.j_ntime)/k.j_ntime.to_f
			end
=end
			temp = @ary.shift
			temp.setstarttime = $now3
			$now3 += temp.j_ntime
			temp.setendtime = $now3
			temp.displayInfo

			avg1 += temp.j_endtime - temp.j_intime
			avg2 += (temp.j_endtime - temp.j_intime)/(temp.j_endtime - temp.j_starttime)
		end

		avg1 /=jobNum.to_f
		avg2 /=jobNum.to_f
		puts "平均周转时间：#{avg1}\t平均带权周转时间：#{avg2}"
	
	end
end


=begin
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
fcfs.run

puts "SJF"
sjf = Sjf.new(ary)
sjf.run

puts "HRN"
hrn = Hrn.new(ary)
hrn.run

=end



