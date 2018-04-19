#_*_ coding:utf-8 _*_
require 'matrix'

the_map = Matrix[[0,6,1,5,99999,99999],[6,0,5,99999,3,99999],[1,5,0,5,6,4],[5,99999,5,0,99999,2],[99999,3,6,99999,0,6],[99999,99999,4,2,6,0]]

def prim(start,map)
  n = map.row_count
  sAry = Array.new(n,false)
  closestAry = Array.new(n,0)
  lowcostAry = Array.new(n,0)
  
  sAry[start] = true

  (0...n).each do |i|
    if i != start
      lowcostAry[i] = map[start,i]
      closestAry[i] = start
    end
  end

  (0...n).each do |i|
    temp = 99999
    t = start
    (0...n).each do |j|
      if !sAry[j] && lowcostAry[j] < temp
        t = j
        temp = lowcostAry[j]
      end
    end
    if t == start
      break
    end
    sAry[t] = true
    (0...n).each do |j|
      if !sAry[j] && map[t,j] < lowcostAry[j]
        lowcostAry[j] = map[t,j]
        closestAry[j] = t
      end
    end
  end
  result = 0
  lowcostAry.each do |item|
    result += item
  end
  puts "最小生成树长度为#{result}"
  closestAry.each_with_index do |item,index|
    puts "#{index} <-> #{item}"
  end
end

prim(0,the_map)
