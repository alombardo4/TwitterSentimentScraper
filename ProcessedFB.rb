class ProcessedFB
	attr_accessor :created_at, :text, :like_count, :comment_count, :picture, :link, :postid, :uri

	def csv_line
		is_text = text.length > 0 ? 'y' : 'n'
		is_question = (text.include? '?') ? 'y' : 'n'
		num_followers = 40290394
		return [postid, uri.to_s, text, '?', '?', picture, link, '?', '?', created_at, text.gsub(/\s+/, "").length, '?', '?', '?', '?', '?', is_text, '?', is_question, '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?', '?']
	end

	def csv_header
		return ['post id', 'link', 'text', 'likes', 'comments', 'picture', 'link', 'comments + favorites', 'engagement', 'created_at', 'characters', 'picture', 'people', 'product', 'video', 'video-length', 'text', 'humor', 'question', 'invitation/call', 'product info', 'brand info', 'event info', 'monetary benefit', 'functional benefit', 'emotional/psych benefit', 'societal benefit', 'new product announcement', 'new package announcement', 'event context', 'time from event', 'fit with event']
	end
end