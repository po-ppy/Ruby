#_*_ coding:utf-8 _*_

class Meeting
  attr_accessor :beginTime,:endTime,:id
  def initialize(id,beginTime,endTime)
    @id,@beginTime,@endTime = id,beginTime,endTime
  end
end

@begin = [1,3,0,5,3,5,6,8,8,2,12]
@end = [4,5,6,7,8,9,10,11,12,13,14]
@ary = Array.new(11,false)
@meetings = []

@end.each_with_index do |item,index|
  @meetings << Meeting.new(index,@begin[index],item) #将会议放放到数组中
end

def greedySelector(beginAry,endAry,ary) #放进的数组是要按结束时间拍好序的
  ary[0] = true
  j,i = 0,1
  while i < beginAry.size
    if beginAry[i] >= endAry[j]
      ary[i] = true
      j = i
    else
      ary[i] = false
    end
    i += 1
  end
end

def greedySelector2(meetingAry)
  meetingAry.sort_by! do |a|
    a.endTime
  end
  selectAry = Array.new(meetingAry.size,false)
  selectAry[0] = true
  j,i = 0,1
  while i < meetingAry.size
    if meetingAry[i].beginTime > meetingAry[j].endTime
      selectAry[i] = true
      j = i
    else
      selectAry[i] = false
    end
    i += 1
  end
  resultAry = []
  selectAry.each_with_index do |yes,index|
    resultAry << meetingAry[index] if yes
  end
  return resultAry
end

#def greedySelector2(beginAry,endAry)
  ##选出最早结束的回忆，如果有两个同时结束，那可能就很尴尬了
  #i = endAry.index(endAry.min)
  #@result << i  #将第一个会议输出
  #j = 0
  #while j < beginAry.size
    #if j == i
      #j += 1
      #next
    #end
    #if endAry[i] <= beginAry[j]
      #@result << j  #输出符合条件的会议
      #i = j
    #end
    #j += 1
  #end
#end

#puts "使用自己理解的方法，结果如下:"
#greedySelector2(@begin,@end)
#puts @result.join(' ')

puts "参照课本改写的方法，结果如下:"
greedySelector(@begin,@end,@ary)

@ary.each_with_index do |item,index|
  if item
    print "#{index} "
  end
end
puts ""

puts "自己修改的方法，结果如下:"
greedySelector2(@meetings).each do |item|
  print "#{item.id} "
end
puts ""
