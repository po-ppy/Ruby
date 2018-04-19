#_*_ coding:utf-8 _*_

def theM(inAry)
  max,min = 0,0
  maxAry = inAry.sort
  while maxAry.size > 2
    temp1 = maxAry.pop
    temp2 = maxAry.pop
    maxAry << temp1 * temp2 + 1
    maxAry.sort
  end
  max = maxAry.pop
  puts "max:#{max}"
  minAry = inAry.sort do |a,b|
    b <=> a
  end
  while minAry.size > 2
    temp1 = minAry.pop
    temp2 = minAry.pop
    minAry << temp1 * temp2 + 1
    minAry.sort!{ |a,b| b <=> a}
  end
  min = minAry.pop
  puts "min:#{min}"
  puts "M:#{max - min}"
end

inAry = [1,2,3,4,5,6,7,8,9]
theM(inAry)
