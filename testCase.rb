#_*_ coding:utf-8 _*_
list1 = %w[he hel hell hello]
list2 = %w[wo wor word]
#没有when后面加数组这种用法，加正则表达式吧
case "hell"
when list1
  puts "I am in list 1"
when list2
  puts "I am in list 2"
when /^he.*/
  puts "I am begin with he"
else
  puts "I am free"
end
