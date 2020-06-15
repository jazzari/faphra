class PhrasesController < ApplicationController

	def index
		@phrases = Phrase.recent.all 
	end

	def show
		@phrase = Phrase.find(params[:id])
	end

	def new
		@phrase = Phrase.new
	end

	def create
		@phrase = Phrase.new(phrase_params)

		if @phrase.save
			redirect_to root_path, notice: 'Faphra was successfully created'
		else
			render :new
		end
	end






	private

	  def phrase_params
	  	params.require(:phrase).permit(:body)
	  end

end