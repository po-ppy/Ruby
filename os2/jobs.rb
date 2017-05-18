#! /bin/ruby
class Job 
	def initialize(name,ntime,resource,status,intime)
		@j_name = name
		@j_ntime = ntime
		@j_intime = intime
		@j_starttime = Time.now
		@j_endtime = Time.now
		@j_resource = resource
		@j_status = status
	end
	def initialize(str)
		ary=str.split(' ')
		@j_name = ary[0]
		@j_ntime = ary[1].to_i
		@j_intime = Time.now
		@j_starttime = Time.now 
		@j_endtime = Time.now 
		@j_resource = ary[2] 
		@j_status = ary[3]

	end

	def simpleDis
		puts "作业名：#{@j_name}"
		puts "需要时间：#{@j_ntime}"
		puts "进入时间：#{@j_intime}"
		puts "开始时间：#{@j_starttime}"
		puts "结束时间：#{@j_endtime}"
		puts "所需资源：#{@j_resource}"
		puts "状态：#{@j_status}"
	end
	def displayInfo
		#puts "作业名：#{@j_name}\t进入时间：#{@j_intime.strftime("%Y-%m-%d %H:%M:%S")}\t开始时间：#{@j_starttime.strftime("%Y-%m-%d %H:%M:%S")}\t完成时间:#{@j_endtime.strftime("%Y-%m-%d %H:%M:%S")}\t周转时间：#{@j_endtime - @j_intime}\t带权周转时间：#{(@j_endtime-@j_intime)/(@j_endtime-@j_starttime)}"
		puts "#{@j_name}\t#{@j_intime.strftime("%Y-%m-%d %H:%M:%S")}\t#{@j_starttime.strftime("%Y-%m-%d %H:%M:%S")}\t#{@j_endtime.strftime("%Y-%m-%d %H:%M:%S")}\t#{@j_endtime - @j_intime}\t#{(@j_endtime-@j_intime)/(@j_endtime-@j_starttime)}"
	end
	def j_name
		@j_name
	end
	def j_ntime
		@j_ntime
	end
	def j_intime
		@j_intime
	end
	def j_starttime
		@j_starttime
	end
	def j_endtime
		@j_endtime
	end
	def j_resource
		@j_resource
	end
	def j_status
		@j_status
	end
	
	def setname=(value)
		@j_name=value
	end
	def setntime=(value)
		@j_ntime=value
	end
	def setintime=(value)
		@j_intime=value
	end
	def setstarttime=(value)
		@j_starttime=value
	end
	def setendtime=(value)
		@j_endtime=value
	end
	def setresource=(value)
		@j_resource=value
	end
	def setstatus=(value)
		@j_status=value
	end
end

