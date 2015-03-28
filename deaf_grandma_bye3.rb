def grandma_talk
  goodbye = false
  count = 0
  while goodbye == false
    puts "What would you like to say to Grandma?"
    say = gets.chomp
    if say != say.upcase 
      puts "HUH?!, SPEAK UP SONNY!"
      count = 0
    else
      if say == "BYE"
        puts "GOOD, I LIKE YOUR SISTER BETTER ANYWAYS!"
        count += 1
      else
        year = rand(1930..1980)
        puts "NO, NOT SINCE #{year}"
        count = 0
      end
    end
    if count == 3
      puts "...AND CLOSE THE DOOR ON YOUR WAY OUT THIS TIME!"
      goodbye = true
    end
  end
end

grandma_talk
