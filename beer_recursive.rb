def beer_recursive (beers)
  if beers == 1
    puts "#{beers} bottle of beer on the wall, #{beers} bottle of beer. Take one down pass it around, #{beers - 1} bottles of beer."
    beers -= 1
    beer_recursive(beers)
  elsif beers == 0
    puts "#{beers} bottles of beer on the wall, #{beers} bottles of beer. Go to the store and buy some more. #{beers + 99} bottles of beer on the wall."
    return
  else
    puts "#{beers} bottles of beer on the wall, #{beers} bottles of beer. Take one down pass it around, #{beers - 1} bottles of beer on the wall."
    beers -= 1
    beer_recursive(beers)
  end
end

beer_recursive(99)