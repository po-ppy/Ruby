#_*_ coding:utf-8 _*_
require './student'
require 'win32ole'

excel = WIN32OLE.new('excel.application')

#excel.visible = true

workbook = excel.Workbooks.open('E:\myruby\win32\15ji.xls')

worksheet2016 = workbook.Worksheets(2)
worksheet2017 = workbook.Worksheets(3)

stuData =  worksheet2016.Range('A6:B34').value

lessonTitle2016 = worksheet2016.Range('C1:N1').value
lessonTitle2017 = worksheet2017.Range('C1:O1').value

lessonTitle2016.flatten!
lessonTitle2017.flatten!

score2016 = worksheet2016.Range('C6:N34').value
score2017 = worksheet2017.Range('C5:O33').value



studentAry = []

#学生姓名学号录入
stuData.each do |item|
  studentAry << Student.new(item[1],item[0])
end

#成绩读入
studentAry.each_with_index do |item,index|
  lessonTitle2016.each_with_index do |elem,i|
    if score2016[index][i]
      item.score.merge!({elem => score2016[index][i]})
    else
      item.score.merge!({elem => 0})
    end
  end
  lessonTitle2017.each_with_index do |elem,i|
    if score2017[index][i]
      item.score.merge!({elem => score2017[index][i]})
    else
      item.score.merge!({elem => 0})
    end
  end
end

#开始排最高分

lessons = lessonTitle2016 + lessonTitle2017
lessons -= [ "Web技术及应用",  "Windows 程序设计",  "嵌入式系统及应用" ,"移动软件开发"]
# 非必修： Linux程序设计? S
#排名注意: Java语言程序设计 数据结构综合训练 数据库综合训练 大学英语 Ⅳ 面向对象程序设计实践
# lessons.each do |item|
#   puts "#{item}"
# end
# puts ""

the_result = Array.new(lessons.size,{})

lessons.each_with_index  do |lesson,index|
  studentAry.sort_by! do |a|
    a.score[lesson]
  end
  studentAry.reverse!
  tempHash = {lesson => {}}
  5.times do |i|
    tempHash[lesson].merge!({studentAry[i].name => studentAry[i].score[lesson]})
  end
  the_result[index] = tempHash

end

the_result.each do |item|
  item.each do |key,value|
    puts "课程名:#{key}"
    puts value
  end
  puts ""
end
#puts worksheet.visible
excel.quit