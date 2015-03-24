def input_to_celsius
	puts "Please enter a Farenheit temperature:"
	temp_in = gets.chomp.to_i 
	(temp_in - 32) * 5.0 / 9
end

puts input_to_celsius
