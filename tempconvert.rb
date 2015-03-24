def menu_choice
	input=0
    while input != 3
	    puts"1. Convert a temperature from Farenheit to Celsius"
	    puts"2. Convert a temperature from Celsius to Farenheit"
	    puts"3. Exit Program"
	    input=gets.chomp
	    if input==1

	    end
	    if input==2

        end
        if input==3

        end
        if input<1 || input>3
        	puts"Please enter an integer between 1 and 3"
        end
    end
end

def temp_to_celsius(temp_in)

	if input==1
		puts"1.