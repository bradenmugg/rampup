require 'httparty'
require 'yelp'

class Restaurant
  attr_accessor :restaurants_list, :chosen_restaurant, :yelp_client
  def initialize
    self.yelp_client = Yelp::Client.new({ consumer_key: "YFvw5LaO007sBT0cJfo5VA",
                            consumer_secret: "6gRc5WnErFM1LBPTyP7Xgnhs9YQ",
                            token: "pETq4bAqWi2pNP2jiPPlD-9tpBCJlbEt",
                            token_secret: "5E-Mwo-Cy13eCz6lxmX9QjairHc"
                          })
    main_menu
  end
  def main_menu
    menu_choice = 0
    while menu_choice != 4
      puts "1. Search for a restaurant by zip code:"
      puts "2. Search for a restaurant by category:"
      puts "3. Search for a restaurant by name:"
      puts "4. Exit the program:"
      menu_choice = gets.chomp.to_i
      if menu_choice == 1
        get_zip
        choose_restaurant
        restaurant_options
      end
      if menu_choice == 2
        get_category
        choose_restaurant
        restaurant_options
      end
      if menu_choice == 3
        get_name
      end
    end
  end

  def get_zip
    puts "Please enter a zip code"
    zipcode = gets.chomp
    encoded_zip = URI.encode(zipcode)
    response = HTTParty.get("https://data.cityofnewyork.us/resource/xx67-kt59.json?zipcode=#{encoded_zip}")
    result = JSON.parse(response.body)
    remove_duplicates(result)
  end

  def get_category
    response = HTTParty.get("https://data.cityofnewyork.us/resource/xx67-kt59.json")
    result = JSON.parse(response.body)
    restaurant_category = []
    result.each do |x|
      if !restaurant_category.include?("#{x["cuisine_description"]}")
        restaurant_category.push(x["cuisine_description"])
      end
    end
    count = 1
    restaurant_category.each do |y|
      puts "#{count}. #{y}"
      count += 1
    end
    puts "Enter a number to choose a category:"
    choice = gets.chomp.to_i
    category = restaurant_category[(choice - 1)]
    encoded_category = URI.encode(category)
    category_response = HTTParty.get("https://data.cityofnewyork.us/resource/xx67-kt59.json?cuisine_description=#{encoded_category}")
    category_result = JSON.parse(category_response.body)
    remove_duplicates(category_result)
  end

  def get_name
    puts "Please enter the name of the restaurant you are looking for"
    restaurant = gets.chomp
    encoded_restaurant = URI.encode(restaurant)
    response = HTTParty.get("https://data.cityofnewyork.us/resource/xx67-kt59.json?dba=#{encoded_restaurant}")
    result = JSON.parse(response.body)
    if result[0] == nil
      puts "There is no restaurant in the database with the name #{restaurant}"
    else
      remove_duplicates(result)
      choose_restaurant
      restaurant_options
    end
  end


  def choose_restaurant
    count = 1
    self.restaurants_list.each do |y|
      puts "#{count}: #{y["dba"]}"
      count += 1
    end
    puts
    puts "Enter a number to choose a restaurant:"
    choice = gets.chomp.to_i
    self.chosen_restaurant = self.restaurants_list[(choice - 1)]
  end

  def restaurant_options
    menu_choice = 0
    while menu_choice != 6
    puts "1. Display the health scores for #{self.chosen_restaurant["dba"]}"
    puts "2. Display health code violations for #{self.chosen_restaurant["dba"]}"
    puts "3. Display the address for #{self.chosen_restaurant["dba"]}"
    puts "4. Display Yelp reviews for #{self.chosen_restaurant["dba"]}"
    puts "5. Return to Main Menu"
    puts "6. Exit the program"
    menu_choice = gets.chomp.to_i
      if menu_choice == 1
        health_scores
      end
      if menu_choice == 2
        violations
      end
      if menu_choice == 3
        address
      end
      if menu_choice == 4
        yelp_ratings
      end
      if menu_choice == 5
        return
      end
      if menu_choice == 6
        exit
      end
    end
  end

  def get_data
    restaurant_id = self.chosen_restaurant["camis"]
    id_encoded = URI.encode(restaurant_id)
    response = HTTParty.get("https://data.cityofnewyork.us/resource/xx67-kt59.json?camis=#{id_encoded}")
    result = JSON.parse(response.body)
    return result
  end

  def remove_duplicates(restaurants_in)
    restaurant_camis = []
    restaurants = []
    restaurants_in.each do |x|
      if !restaurant_camis.include?("#{x["camis"]}")
        restaurant_camis.push(x["camis"])
        restaurants.push(x)
      end
    end
    self.restaurants_list = restaurants
  end

  def health_scores
    result = get_data
    inspection_dates = []
    scores = []
    result.each do |x|
      if !inspection_dates.include?("#{x["inspection_date"]}")
        inspection_dates.push(x["inspection_date"])
        scores.push(x["score"])
      end
    end
    loops = scores.size
    count = 0
    (1..loops).each do
      puts "On #{inspection_dates[count]} #{self.chosen_restaurant["dba"]} received a score of #{scores[count]}"
      count += 1
    end
  end

  def violations
    result = get_data
    result.each do |x|
      puts "#{x["inspection_date"]} Violation: #{x["violation_description"]}"
    end
  end

  def address
    puts "#{self.chosen_restaurant["dba"]} is located at #{self.chosen_restaurant["building"]} #{self.chosen_restaurant["street"]} in #{self.chosen_restaurant["boro"]}, New York"
  end

  def yelp_ratings
    
    response = self.yelp_client.phone_search("+1#{self.chosen_restaurant["phone"]}")
    if response.businesses[0].to_s != ""
      puts "#{self.chosen_restaurant["dba"]} has an average rating of #{response.businesses[0].rating} out of #{response.businesses[0].review_count} reviews."
    else
      puts "There are no reviews available for this restaurant yet. Please select another option."
    end
  end
end



Restaurant.new