#_*_ coding:utf-8 _*_

# def partition(number)
#   if number == 1
#     return " 1 \n"
#   else
#     (0..(number/(number-1))).each do |i|
#         return " #{number-1} "*i + partition(number-1)*((number/(number-1) - i))
#       end
#   end
#
# end

@count = 0
def partition(n,m)
  if (n ==1 || m == 1)
     return 1
  end
  if (n <= m)
    return 1 + partition(n,n-1)
  else
    return partition(n-m,m) + partition(n,m-1)
  end

end

puts "测试  #{partition(6,6)}"

# @count = 0
# @set = Array.new(100,0)
# @k = 0;
# #
# def printPartition( n,m,i)
#
#   if n == @k && n != m
#     puts "gg"
#     @k = 0;
#   end
#   if n == 1
#     print "1 "
#     @count +=1
#     return
#   elsif m == 1
#     (1...n).each do
#       print "1+"
#     end
#     print "1 "
#     return
#   end
#   if n < m
#     printPartition n,n,i
#   end
#   if n == m
#     print "#{n} "
#     @count += 1
#     (0...i).each do |j|
#       print "#{@set[j]}+"
#     end
#     printPartition(n ,m-1, i)
#   end
#   if n > m
#     print "#{m}+"
#     @set[i] = m
#     i += 1
#     printPartition n-m,m,i
#     i -= 1
#     (0...i).each do |j|
#       print "#{@set[j]}+"
#     end
#     printPartition(n,m-1,i)
# end
#
# end
# @k = 6
# printPartition 6,6,0
#
# puts "@count = #{@count}"

