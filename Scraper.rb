require "rubygems"
require "twitter"
require 'csv'
require_relative "ProcessedTweet"

twitter_client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ''
  config.consumer_secret     = ''
  config.access_token        = ''
  config.access_token_secret = ''
end




def collect_with_max_id(collection=[], max_id=nil, &block)
  response = yield(max_id)
  collection += response
  response.empty? ? collection.flatten : collect_with_max_id(collection, response.last.id - 1, &block)
end

def twitter_client.get_all_tweets(user)
  collect_with_max_id do |max_id|
    options = {:count => 2, :include_rts => true}
    options[:max_id] = max_id unless max_id.nil?
    user_timeline(user, options)
  end
end
puts "running"
options = { :count => 150}
tweets = twitter_client.user_timeline("SamsungMobile", options)


ptweets = Array.new
tweets.each do |tweet|
	ptweet = ProcessedTweet.new
  ptweet.text = tweet.text.to_s
  ptweet.created_at = tweet.created_at.to_s
  ptweet.retweet_count = tweet.retweet_count.to_s
  # pentities = tweet.entities
  # ptweet.entities = entities
  ptweet.hashtags = tweet.hashtags.count.to_s
  ptweet.user_mentions = tweet.user_mentions.count.to_s
  ptweet.retweeted = tweet.retweeted?.to_s
  ptweet.in_reply_to_user_id = tweet.in_reply_to_user_id.to_s
  ptweets << ptweet
end

CSV.open('processedTweets.csv', 'w') do |csv|
  csv << ptweets[0].csv_header
  ptweets.each do |tweet|
    csv << tweet.csv_line
  end
end