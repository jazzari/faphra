class UsersController < ApplicationController 


	def index
		@ownphrases = Phrase.recent.where(:user_id => current_user.id)
	end

end