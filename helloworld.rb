first_name = "Bob"

def say_hello(name)
	"Hello " +name
end

def shout_it
	puts "What is your name?"
	name=gets
	say_hello(name).upcase
end

name=gets
puts name