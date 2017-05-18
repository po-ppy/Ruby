# _*_ encoding:utf-8 _*_

$global_var = 10

class Person
	
	@@nation = 0
	VAR = 100
	
	def initialize(name,height)
		@pname=name
		@pheight=height
	end

	def hello
		puts "global_var is #{$global_var}"
		puts "hello,I am #{@pname},my height is #{@pheight}"
		@@nation += 1
		puts "@@nation is #{@@nation}"
		puts "var1 is #{VAR}"
	end
	def show
		puts "var1 is #{VAR}"
	end
end

p1 = Person.new("poppy",12)
p2 = Person.new("Bob",15)
p1.hello
p2.hello

puts "#{_FILE_}"