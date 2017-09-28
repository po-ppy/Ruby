#_*_ coding:utf-8 _*_
require 'matrix'
class Matrix
  def []=(x,y,a)
    @rows[x][y] = a
  end
end

def knapSack(weightAry,vAry)
  n = 
  cMap = Matrix.zero(vAry.size,10)
  (0..n).each do |i|
     cMap[i,0] = 0
     cMap[0,i] = 0
  end
  (1..n).each do |i|
     (1..n).each do |j|
       if j < weightAry[i]
         cMap[i,j] = cMap[i-1,j]
       else
         cMap[i,j] = max(cMap[i-1,j],cMap[i-1,j-weightAry[i]]+vAry[i])
       end
     end
  end
  j = weight.size
end
