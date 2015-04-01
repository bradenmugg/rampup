def leap
  puts "Enter a starting year"
  min = gets.chomp.to_i
  puts "Enter an ending year"
  max = gets.chomp.to_i
  (min..max).select { |x| x if x % 4 == 0 and x % 100 != 0 or x % 400 == 0} 
end


leap_years = leap
puts(leap_years)ß