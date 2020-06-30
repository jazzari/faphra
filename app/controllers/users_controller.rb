class UsersController < ApplicationController 

	def index
		@ownphrases = Phrase.recent.where(:user_id => current_user.id)
	end

	def show
		@user = User.find(params[:id])
	end

	def search
		if params[:search].blank?  
    		redirect_to(root_path, alert: "Empty field!") and return  
  		else  
  			@parameter = params[:search].downcase
  			@results = User.all.where('lower(username) LIKE :search', 
  				search: "%#{@parameter}%")
  		end 
	end

end