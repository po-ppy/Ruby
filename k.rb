#file = File.new("a.rb","r")
#if file
	#file.each_byte { |ch| putc ch}
#else
	#puts "Unable to open file!"
#end
#puts "a.rb is readable" if File.readable?("a.rb")
#puts Dir.entries("/mnt/d/myruby").join(' ')
#Dir.foreach("/mnt/d/myruby") do |entry|
	#puts entry
#end

def promptAndGet(prompt)
	print prompt
	res = readline.chomp
	throw :quitRequested if res == "!"
	return res
end

catch :quitRequested do
	name = promptAndGet("Name:")
	age = promptAndGet("Age:")
	sex = promptAndGet("Sex:")
end
promptAndGet("Name:")
