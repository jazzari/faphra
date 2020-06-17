class PhrasesController < ApplicationController
	before_action :set_phrase, only: [:edit, :show, :update]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@phrases = Phrase.recent.all 
	end

	def show

	end

	def new
		@phrase = Phrase.new
	end

	def edit

	end

	def create
		@phrase = Phrase.new(phrase_params)

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



	private

	  def set_phrase 
	  	@phrase = Phrase.find(params[:id])
	  end

	  def phrase_params
	  	params.require(:phrase).permit(:id, :body)
	  end

end