class User < ApplicationRecord
	acts_as_voter

	validates :username, presence: true, length: { minimum: 4, maximum: 12 }
  validates :email, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, 
    message: "valid email please"
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :phrases, dependent: :destroy

  has_many :follower_relationships, foreign_key: :following_id, class_name: 'Follow'
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :following_relationships, foreign_key: :follower_id, class_name: 'Follow'
  has_many :following, through: :following_relationships, source: :following
  
  def follow(user_id)
    following_relationships.create(following_id: user_id)
  end
  
  def unfollow(user_id)
    following_relationships.find_by(following_id: user_id).destroy
  end



end
