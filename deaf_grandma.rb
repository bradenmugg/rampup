def grandma_talk
  goodbye = false
  while goodbye == false
    puts "What would you like to say to Grandma?"
    say = gets.chomp
    if say != say.upcase 
      puts "HUH?!, SPEAK UP SONNY!"
    else
      if say == "BYE"
        puts "GOOD, I LIKE YOUR SISTER BETTER ANYWAYS!"
        goodbye = true
      else
        year = rand(1930..1980)
        puts "NO, NOT SINCE #{year}"
      end
    end
  end
end

grandma_talk
