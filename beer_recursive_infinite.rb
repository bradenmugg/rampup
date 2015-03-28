def beer_recursive (beers)
  if beers == 1
    puts "#{beers} bottle of beer on the wall, #{beers} bottle of beer."
    beers -= 1
    puts "Take one down pass it around, #{beers} bottles of beer."
    beers=99
    puts "Go to the store and buy some more, #{beers} bottles of beer on the wall"
    beer_recursive(beers)
  else
    puts "#{beers} bottles of beer on the wall, #{beers} bottles of beer."
    beers -= 1
    puts "Take one down pass it around, #{beers} bottles of beer on the wall."
    beer_recursive(beers)
  end
end

beer_recursive(99)