require 'twitter'

client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ""
  config.consumer_secret     = ""
  config.access_token        = "-"
  config.access_token_secret = ""
end


# search for hashtag ruby and print the 50 first

client.search("#ruby").take(1).each do |tweet|
  puts tweet.text
end


search_options = {
  result_type: "recent",
  geocode: "37.7749295,-122.4194155,10mi"
}

#we take the 50 first tweet in search option with the query pope
client.search("blockchain", search_options).take(1).each do |tweet|
  puts "#{tweet.user.screen_name}: #{tweet.text}"
 client.favorite(tweet) # we favorite the tweet
 #then we reply
 client.update("@#{tweet.user.screen_name} Bitcoin!", in_reply_to_status_id: tweet.id)
end

