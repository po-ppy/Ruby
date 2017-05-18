ary = [1,2,3,4,5]

ary.each do |i|
	case i
	when 1..2
		puts "now is 1 or 2"
	when 3..4
		puts "now is 3 or 4"
	else
		puts "now is 5"
	end
end
