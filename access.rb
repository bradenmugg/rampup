require 'yelp'

Yelp.client.configure do |config|
  config.consumer_key = "YFvw5LaO007sBT0cJfo5VA"
  config.consumer_secret = "6gRc5WnErFM1LBPTyP7Xgnhs9YQ"
  config.token = "pETq4bAqWi2pNP2jiPPlD-9tpBCJlbEt"
  config.token_secret = "5E-Mwo-Cy13eCz6lxmX9QjairHc"
end

response = Yelp.client.phone_search('+17188924968')
puts response.businesses[0].name

