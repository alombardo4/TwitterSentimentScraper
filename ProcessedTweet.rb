class ProcessedTweet
	attr_accessor :created_at, :text, :retweet_count, :entities, :hashtags, :user_mentions, :retweeted, :in_reply_to_user_id

	def csv_line
		entity_list = ""
		if entities
			entities.each do |entity|
				entity_list = entity_list + entity + '|'
			end
		end 
		is_text = text.length > 0 ? 'y' : 'n'
		is_question = text.contains('?') ? 'y' : 'n'
		return [text, hashtags, retweeted, in_reply_to_user_id, user_mentions, retweet_count, created_at, entity_list, text.gsub(/\s+/, "").length, '?', '?', '?', '?', '?', is_text, '?', is_question, '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?']
	end

	def csv_header
		return ['text', 'hashtags', 'retweeted', 'in_reply_to_user_id', 'user_mentions', 'retweet_count', 'created_at', 'entities','characters', 'picture', 'people', 'product', 'video', 'video-length', 'text', 'humor', 'question', 'invitation/call', 'product info', 'brand info', 'event info', 'monetary benefit', 'functional benefit', 'emotional/psych benefit', 'societal benefit', 'new product announcement', 'new package announcement', 'event context', 'time from event', 'fit with event']
	end
end