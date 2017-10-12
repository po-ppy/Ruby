#_*_ coding:utf-8 _*_
require 'matrix'
class Matrix
  def []=(x,y,a)
    @rows[x][y] = a
  end
end
def max(a,b)
  a > b ? a : b
end

def knapSack(weightAry,vAry,capacity)
  n =  weightAry.size - 1
  cMap = Matrix.zero(vAry.size,capacity+1)
  (0..n).each do |i|
     cMap[i,0] = 0
  end
  (0..capacity).each do |i|
    cMap[0,i] = 0
  end
  (1..n).each do |i|
     (1..capacity).each do |j|
       if j < weightAry[i]
         cMap[i,j] = cMap[i-1,j]
       else
         cMap[i,j] = max(cMap[i-1,j],cMap[i-1,j-weightAry[i]]+vAry[i])
       end
     end
  end
  j = capacity
  xAry = Array.new(n+1,0)
  n.step(1,-1) do |i|
    if cMap[i,j] > cMap[i-1,j]
      xAry[i] = 1
      j -= weightAry[i]
    else
      xAry[i] = 0
    end
  end
  #return cMap[n,capacity],xAry
  return cMap,xAry
end

@weightAry = [0,2,2,6,5,4]
@vAry = [0,6,3,5,4,6]

result,x = knapSack(@weightAry,@vAry,10)
result.row_vectors.each do |row|
  row.each do |i|
    print "#{i} "
  end
  puts ""
end
puts x.join(' ')
