class PhrasesController < ApplicationController

	def index
		@phrases = Phrase.all.order("created_at DESC")
	end

end