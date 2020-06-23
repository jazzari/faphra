class PhrasesController < ApplicationController
	before_action :set_phrase, only: [:edit, :show, :update, :destroy, :like]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@phrases = Phrase.recent.all 
		@users = User.all
		unless current_user.blank?
			@ownphrases = Phrase.recent.where(:user_id => current_user.id)
		end
	end

	def show

	end

	def new
		@phrase = current_user.phrase.build
	end

	def edit

	end

	def create
		@phrase = current_user.phrases.build(phrase_params)

		if @phrase.save
			flash[:success] = "Faphra was successfully created"
			redirect_to root_path
		else
			render :new
		end
	end

	def update
		if @phrase.update(phrase_params)
			flash[:success] = "Faphra was updated successfully!"
			redirect_to phrase_path(@phrase)
		else
			render 'edit'
		end 
	end

	def destroy
		@phrase.destroy
		flash[:notice] = "Faphra was deleted successfully"

		redirect_to phrases_path
	end

	def like 
		if @phrase.liked_by current_user 
			respond_to do |format|
				format.html { redirect_to :back }
				format.js
			end
		end
	end

	def unlike
		if @phrase.unliked_by current_user
			respond_to do |format|
				format.html { redirect_to :back }
				format.js
			end
		end
	end



	private

	  def set_phrase 
	  	@phrase = Phrase.find(params[:id])
	  end

	  def phrase_params
	  	params.require(:phrase).permit(:id, :body)
	  end

end