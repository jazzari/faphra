class CommentsController < ApplicationController
	before_action :set_phrase, only: [:edit, :create, :destroy]

	def edit
		
	end

	def create 
		@comment = @phrase.comment.build(comment_params)
		@comment.user_id = current_user.id
		if @comment.save
			flash[:success] = "The comment was created successfully!"
			redirect_to :back
		else
			flash[:alert] = "The comment failed to be created."
			redirect_to root_path
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
		@phrase = Phrase.find(params[:phrase.id])
	end

end
