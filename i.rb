H = Hash["a" => 100,"b" => 200]
puts H['a']
puts H['b']
H.fetch('c') {
	|i|
	puts "#{i} not in"
}
ary = H.keys
puts ary
