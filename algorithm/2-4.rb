#_*_ coding:utf-8 _*_

def findMin(numStr,count,printOut = false)
  ary = numStr.to_s.strip.split(//)
  if count == ary.size
    puts "delete all???"
  end
  count.times do |i|
    ary.each_with_index do |item,index|
      if (item.to_i > ary[index+1].to_i)
        ary.delete_at(index)
        break
      end
    end
  end
  if printOut
    puts ary.join('')
  end
  return ary
end

puts "input the num:"
input  = gets.to_s
puts "input the k:"
count = gets.to_i
puts "result:"
findMin(input,count,true)
