module PhrasesHelper 

	def display_likes(phrase)
		votes = phrase.votes_for.up.by_type(User)
		return list_likers(votes) if votes.size <= 8
		count_likers(votes)
	end

	def liked_phrase(phrase)
		unless current_user.blank?
			return 'fa-heart' if current_user.voted_for? phrase 
			'fa-heart-o'
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
			return ' like this' if votes.count >1
			' likes this'
		end

end