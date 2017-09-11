#_*_ coding:utf-8 _*_
@set = Array.new(100,0)
@k = 0

def printPartition(n,m,i)
  if n == @k && n != m
    i = 0
    puts ""
  end

  if n == 1
    print "1 "
    return
  elsif m == 1
    (1...n).each do 
      print "1+"
    end
    print "1 "
    return
  end
  if n < m
    printPartition(n,n,i)
  end
  if n == m
    print "#{n} "
    (0...i).each do |j|
      print "#{@set[j]}+"
    end
    printPartition(n,m-1,i)
  end
  if n > m
    print "#{m}+"
    @set[i] = m
    i += 1
    printPartition(n-m,m,i)
    i -= 1
    (0...i).each do |j|
      print "#{@set[j]}+"
    end
    printPartition(n,m - 1 ,i)
  end
end

@k = gets.to_i
printPartition(@k,@k,0)
puts ""
