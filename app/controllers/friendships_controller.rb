class FriendshipsController < ApplicationController
  before_action :set_user, only: [:follow_user, :unfollow_user]
	
  def follow_user
    if current_user.follow @user.id
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js 
      end
    end
  end
  
  def unfollow_user
    if current_user.unfollow @user.id
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js 
      end
    end
  end

def follower
  id = current_user.followers.pluck(:id)
  @follower = User.find_by(id: id)
end

def following
  id = current_user.following.pluck(:id)
  @following = User.find_by(id: id)
end
  

  private

    def set_user
          @user = User.find_by! id: params[:id]
    end

end
