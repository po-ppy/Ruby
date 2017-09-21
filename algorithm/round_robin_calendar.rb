#_*_ coding:utf-8 _*_
#将课本的c语言版用ruby重写

require 'matrix'
class Matrix
  def []=(i,j,x)
    @rows[i][j] = x
  end
end

def round_calendar(k)
  n = 1
  k.times do 
    n *= 2
  end
  #map = Array.new(n+1,Array.new(n+1,-1))
  map = Matrix.zero(n+1)
  (1..n).each do |i|
    map[1,i] = i
  end
  
  m = 1
  (1..k).each do |s|
    n /= 2
    (1..n).each do |t|
      ((m+1)..(2*m)).each do |i|
        ((m+1)..(2*m)).each do |j|
          map[i,j + (t-1)*m*2] = map[i-m,j+(t-1)*m*2 - m]
          map[i,j+(t-1)*m*2-m] = map[i-m,j+(t-1)*m*2]
        end
      end
    end
    m *= 2
  end
  return map
end


result = round_calendar(3)
result.row_vectors.each do |tempAry|
  tempAry.each do |item|
    print "#{item} "
  end
  puts ""
end
