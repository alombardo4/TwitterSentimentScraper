class ProcessedTweet
	attr_accessor :created_at, :text, :retweet_count, :entities, :hashtags, :user_mentions, :retweeted, :in_reply_to_user_id

	def csv_line
		entity_list = ""
		if entities
			entities.each do |entity|
				entity_list = entity_list + entity + '|'
			end
		end 
		
		return [text, hashtags, retweeted, in_reply_to_user_id, user_mentions, retweet_count, created_at, entity_list]
	end

	def csv_header
		return ['text', 'hashtags', 'retweeted', 'in_reply_to_user_id', 'user_mentions', 'retweet_count', 'created_at', 'entities']
	end
end