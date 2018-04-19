#_*_ coding:utf-8 _*_
require 'matrix'

class Matrix
  def []=(i,j,x)
    @rows[i][j]=x
  end
end
@c = Matrix[[0,8,32,99999,99999],[12,0,16,15,99999],[99999,29,0,99999,13],[99999,21,99999,0,7],[99999,99999,27,19,0]]
@dist = Array.new(5,0)
@p = Array.new(5,0)

def dijkstra(u,distAry,preAry,cMap)
  n = cMap.row_count
  s = Array.new(n,false)
  (0...n).each do |i|
    distAry[i] = cMap[u,i].to_i
    if distAry[i] > 9999
      preAry[i] = -1
    else
      preAry[i] = u
    end
  end
  s[u] = true
  (0...n).each do |i|
    temp = 99999
    t = u
    (0...n).each do |j|
      if !s[j] && distAry[j] < temp
        t = j
        temp = distAry[j]
      end
    end
    if t == u
      break
    end
    s[t] = true
    (0...n).each do |j|
      if !s[j] && cMap[t,j].to_i < 9999
        if distAry[j] > (distAry[t] + cMap[t,j].to_i)
          distAry[j] = distAry[t] + cMap[t,j].to_i
          preAry[j] = t
        end
      end
    end
  end
end

dijkstra(0,@dist,@p,@c)
puts "顶点与源点u的最短路径长度,distAry"
puts @dist
puts "顶点到源点的最短路径上的该顶点的前驱顶点，preAry"
puts @p
