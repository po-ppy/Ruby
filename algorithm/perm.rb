#_*_ coding:utf-8 _*_
numAry = [1,2,3]

def swap(ary,p,n)
  temp = ary[p]
  ary[p] = ary[n]
  ary[n] = temp
end

def perm(ary,k)
  if k == 1
    puts ary.join(' ')
  else
    ((ary.size-k)...ary.size).each do |i|
      swap(ary,i,ary.size - k)
      perm(ary.clone,k-1)
      #swap(ary,i,ary.size-k)
    end
  end
end

def perm2(ary,k)
  if k == ary.size - 1
    puts ary.join(' ')
  else
    (k...ary.size).each do |i|
      swap(ary,k,i)
      perm2(ary,k+1)
      swap(ary,k,i)
    end
  end
end

puts "初始numAry"
puts numAry.join(' ')
puts "使用perm运行结果"
perm(numAry,numAry.size)
puts "现在的numAry"
puts numAry.join(' ')
puts "使用perm2的运行结果"
perm2(numAry,0)
puts "现在的numAry"
puts numAry.join(' ')
