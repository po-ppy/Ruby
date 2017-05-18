def test
	puts "11111111"
	yield 5

	puts "222222222"
end
test {
	|i|
	while i > 0 do
		puts "hello world"
		i -= 1
	end
	
}
