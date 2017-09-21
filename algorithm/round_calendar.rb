#_*_ coding:utf-8 _*_
require 'matrix'
#给矩阵类添加可以修改内部元素的方法
class Matrix
  def []=(x,y,k)
    @rows[x][y] = k
  end
end

#方法定义
def round_calendar(num)
  n = 1 
  k = 0 
  while n < num
    n *= 2 # n为要拍的总个数
    k += 1 # k => 2**k = n
  end
  map = Matrix.zero(n)
  (0...n).each do |i|
    map[i,0] = i # 矩阵第一列初始化为编号
  end
  (1..k).each do |s| # s:每次子问题的规模是 2**s
    m = n / 2**s # s规模下子问题个数
    m.times.each do |t| # 对每个子问题进行求解
      ((2**s*t)...(2**s*(t+1))).each do |i| # 子问题行范围
        ((2**(s-1))...(2**s)).each do |j| # 子问题列范围
          if i < (2**s*t + 2**(s-1))  # 判断属于右上角还是右下角
            map[i,j] = map[i+2**(s-1),j-2**(s-1)] #右上角的值等于左下角的值
          else
            map[i,j] = map[i-2**(s-1),j-2**(s-1)] #右下角的值等于左上角的值
          end
        end
      end
    end
    
  end
  return map  #返回问题解
end

#问题解输出
round_calendar(8).row_vectors.each do |tempAry|
  tempAry.each do |item|
    print "#{item} "
  end
  puts ""
end

#   结果如下
#   poppy@Sighs:~/Ruby/algorithm$ ruby round_calendar.rb 
#   0 1 2 3 4 5 6 7 
#   1 0 3 2 5 4 7 6 
#   2 3 0 1 6 7 4 5 
#   3 2 1 0 7 6 5 4 
#   4 5 6 7 0 1 2 3 
#   5 4 7 6 1 0 3 2 
#   6 7 4 5 2 3 0 1 
#   7 6 5 4 3 2 1 0 

