def name_and_age
	puts "Pleaser enter your name:"
	name = gets.chomp
	puts "Please enter your age:"
	age = gets.chomp.to_i
	age = 2015 - age
	age = age.to_s
	name + " was born around " + age + "."
end

puts name_and_age