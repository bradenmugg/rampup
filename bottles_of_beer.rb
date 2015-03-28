def bottles_of_beer(beers)
  while beers > 1
	  puts "#{beers} bottles of beer on the wall, #{beers} bottles of beer. Take one down pass it around, #{beers - 1} bottles of beer on the wall."
    beers -= 1
  end
  puts "#{beers} bottle of beer on the wall, #{beers} bottle of beer. Take one down pass it around, #{beers - 1} bottles of beer."
  puts "#{beers} bottles of beer on the wall, #{beers} bottles of beer. Go to the store and buy some more. #{beers + 98} bottles of beer on the wall."
end

bottles_of_beer(99)