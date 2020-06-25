class CommentsController < ApplicationController
	before_action :set_phrase, only: [:edit, :create, :destroy]
	before_action :set_comment, only: [:show, :edit, :update, :destroy]


	def new
		@comment = @phrase.comment.build
	end
	
	def create 
		@comment = @phrase.comments.build(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			respond_to do |format|
				format.html { redirect_to root_path }
				format.js
			end
		else
			flash[:alert] = "The comment failed to be created."
			render root_path
		end
	end

	def destroy
		@comment.destroy
		flash[:notice] = "The comment was deleted!"
		redirect_to root_path
	end



	private

	def comment_params
		params.require(:comment).permit(:content)
	end

	def set_phrase
		@phrase = Phrase.find(params[:phrase_id])
	end

	def set_comment
		@comment=@phrase.comments.find(params[:id])
	end

end
