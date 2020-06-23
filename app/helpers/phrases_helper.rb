module PhrasesHelper 

	def likers_of(phrase)
		votes = phrase.votes_for.up.by_type(User)
		user_names = []
		unless votes.blank?
			votes.voters.each do |voter|
				user_names.push(voter.username.capitalize)
			end

		user_names.to_sentence.html_safe + like_plural(votes)
		end
	end

	private

		def like_plural(votes)
			return ' like this' if votes.count >1
			' likes this'
		end

end