require 'matrix'

class Matrix
  def []=(i, j, x)
    @rows[i][j] = x
  end
end
@c = Matrix[[0, 8, 32, 99_999, 99_999], [12, 0, 16, 15, 99_999], [99_999, 29, 0, 99_999, 13], [99_999, 21, 99_999, 0, 7], [99_999, 99_999, 27, 19, 0]]
@dist = Array.new(5, 0)
@p = Array.new(5, 0)

def dijkstra(u, distAry, preAry, cMap)
  n = cMap.row_count
  s = Array.new(n, false)
  (0...n).each do |i|
    distAry[i] = cMap[u, i].to_i
    preAry[i] = if distAry[i] > 9999
                  -1
                else
                  u
                end
  end
  s[u] = true
  (0...n).each do |_i|
    temp = 99_999
    t = u
    (0...n).each do |j|
      if !s[j] && distAry[j] < temp
        t = j
        temp = distAry[j]
      end
    end
    break if t == u

    s[t] = true
    (0...n).each do |j|
      next unless !s[j] && cMap[t, j].to_i < 9999

      if distAry[j] > (distAry[t] + cMap[t, j].to_i)
        distAry[j] = distAry[t] + cMap[t, j].to_i
        preAry[j] = t
      end
    end
  end
end

dijkstra(0, @dist, @p, @c)
puts '顶点与源点u的最短路径长度,distAry'
puts @dist
puts '顶点到源点的最短路径上的该顶点的前驱顶点，preAry'
puts @p
