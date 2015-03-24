def num_guess

magic_num = rand(100)
counter = 10

while counter > 0
	puts "Guess a number"
	guess = gets.chomp.to_i
	
	if guess == magic_num
		puts "Good job!"
		break
	end

	puts guess < magic_num ? "Your guess is too low." : "Your guess is too high."
	counter -= 1
	puts " You have #{counter} guesses left."
end

puts "The number was #{magic_num}."
		
end

num_guess		