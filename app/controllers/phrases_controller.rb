class PhrasesController < ApplicationController
	before_action :set_phrase, only: [:edit, :show, :update, :destroy,
	 :like, :unlike]
	before_action :authenticate_user!, except: [:index, :show]

	def index
		@phrases = Phrase.recent.all.page params[:page]
		@users = User.all
		unless current_user.blank?
			@ownphrases = Phrase.recent.where(:user_id => current_user.id).page params[:page]
			@followedphrases = Phrase.of_followed_users(current_user.following).
				recent.page params[:page]

			if params[:search]
				params[:topic] = 'music'
				redirect_to action: 'tagged' 
				#@phrases = Phrase.tagged_with(params[:search]).order("created_at DESC")
				#redirect_to controller: 'phrases', action: 'tagged', topic: params[:search]
				
			else
				@feedphrases = (@followedphrases + @ownphrases).sort_by(&:created_at).
				reverse
			end
		end
		@topics = ActsAsTaggableOn::Tagging.includes(:tag).where(context: 'topics').
			map { |tagging| { 'name' => tagging.tag.name } }.pluck("name").uniq
		@most_used_topics = ActsAsTaggableOn::Tag.most_used(4).map(&:name)
	end

	def show

	end

	def new
		@phrase = current_user.phrases.build
	end

	def edit

	end

	def create
		@phrase = current_user.phrases.build(phrase_params)

		if @phrase.save
			flash[:notice] = "Faphra was successfully created"
			redirect_to root_path
		else
			render :new
		end
	end

	def update
		if @phrase.update(phrase_params)
			flash[:notice] = "Faphra was updated successfully!"
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

	def tagged
		
	  if params[:topic].present?
	    @phrases = Phrase.tagged_with(params[:topic])
	  else
	    @phrases = Phrase.all
	  end
	end




	private

	  def set_phrase 
	  	@phrase = Phrase.find(params[:id])
	  end

	  def phrase_params
	  	params.require(:phrase).permit(:id, :body, :topic_list)
	  end

end