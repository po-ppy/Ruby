#_*_ coding:utf-8 _*_

@count = 0

while true
  temp = gets.to_i
  case temp
    when 1
      @count += 0.15
    when 2
      @count += 0.1
    when 3
      @count += 0.05
    when 0
      puts "总分#{@count}"
      @count = 0
    else
      puts "请输入[0,1,2,3]四个数字中之一"
      puts "1 -> A"
      puts "2 -> B"
      puts "3 -> C"
      puts "0 -> 输出分数，进行下一次计算"
    end
end
