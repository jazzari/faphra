class UsersController < ApplicationController 

	def index
		@ownphrases = Phrase.recent.where(:user_id => current_user.id)
	end

	def show
		@user = User.find(params[:id])
	end

end