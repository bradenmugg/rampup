require "httparty"
puts "Please enter a zip code"
restaurant = gets.chomp.to_i
    encoded_response = restaurant
    response = HTTParty.get("https://data.cityofnewyork.us/resource/xx67-kt59.json?zipcode=#{encoded_response}")
    result = JSON.parse(response.body)
    puts result