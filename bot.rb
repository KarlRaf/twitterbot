#!/usr/bin/env ruby

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "YOUR_CONSUMER_KEY"
  config.consumer_secret     = "YOUR_CONSUMER_SECRET"
  config.access_token        = "YOUR_ACCESS_TOKEN"
  config.access_token_secret = "YOUR_ACCESS_SECRET"
end


#search for hashtag ruby and print the 50 first

client.search("#ruby").take(50).each do |tweet|
  puts tweet.text
end



search_options = {
  result_type: "recent",
  geocode: "39.9525839,-75.1652215,10mi"
}

#we take the 50 first tweet in search option with the query pope
client.search("pope", search_options).take(50).each do |tweet|
  puts "#{tweet.user.screen_name}: #{tweet.text}"
 client.favorite(tweet) # we favorite the tweet
 #then we reply
 client.update("@{tweet.user.screen_name} Welcome to Philadelphia!")
end
