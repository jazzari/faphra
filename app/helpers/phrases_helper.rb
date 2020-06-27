module PhrasesHelper 

	def display_likes(phrase)
		votes = phrase.votes_for.up.by_type(User)
		return list_likers(votes) if votes.size <= 8
		count_likers(votes)
	end

	def liked_phrase(phrase)
		unless current_user.blank?
			if current_user.voted_for? phrase
				return link_to '', unlike_phrase_path(phrase), remote: true,
				id: "like_#{phrase.id}", 
				class: 'btn btn-light text-dark btt-like btn fa fa-heart' 
			else 
				return link_to '', like_phrase_path(phrase), remote: true,
				id: "like_#{phrase.id}", 
				class: 'btn btn-outline-light text-dark btt-like btn fa fa-heart-o'
			end				 
		end

	end

	private

		def list_likers(votes)
			user_names = []

			unless votes.blank?
				votes.voters.each do |voter|
					user_names.push(voter.username.capitalize)
				end

			user_names.to_sentence.html_safe + like_plural(votes)
			end
		end

		def count_likers(votes)
			vote_count = votes.size 
			vote_count.to_s + ' likes'

		end

		def like_plural(votes)
			return ' like this' if votes.count > 1
			' likes this'
		end

end