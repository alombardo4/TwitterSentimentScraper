class ProcessedTweet
	attr_accessor :created_at, :text, :retweet_count, :favorites, :entities, :hashtags, :user_mentions, :retweeted, :in_reply_to_user_id, :postid, :link, :favorite_count, :uri

	def csv_line
		is_text = text.length > 0 ? 'y' : 'n'
		is_question = (text.include? '?') ? 'y' : 'n'
		num_followers = 9950000
		return [postid, uri.to_s, text, hashtags, retweeted ? 'y' : 'n', in_reply_to_user_id, user_mentions, retweet_count, favorite_count, (favorite_count.to_i + retweet_count.to_i).to_s, ((favorite_count.to_f + retweet_count.to_f)/num_followers * 100).to_s + '%', created_at, entities, text.gsub(/\s+/, "").length, '?', '?', '?', '?', '?', is_text, '?', is_question, '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?']
	end

	def csv_header
		return ['post id', 'link', 'text', 'hashtags', 'retweeted', 'in_reply_to_user_id', 'user_mentions', 'retweet_count', 'favorite count', 'retweet + favorite', 'engagement', 'created_at', 'entities','characters', 'picture', 'people', 'product', 'video', 'video-length', 'text', 'humor', 'question', 'invitation/call', 'product info', 'brand info', 'event info', 'monetary benefit', 'functional benefit', 'emotional/psych benefit', 'societal benefit', 'new product announcement', 'new package announcement', 'event context', 'time from event', 'fit with event']
	end
end