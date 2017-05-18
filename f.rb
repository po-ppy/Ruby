class Acc
	def Acc.putsome
		puts "putsome ok"
	end
end
def fun1(name = "poppy",height = 2)
	puts "I am fun1,myname is #{name},my height is #{height}"
end
def fun2()
	puts "I am fun2"
end
fun1
fun1("ddd",33)

Acc.putsome
