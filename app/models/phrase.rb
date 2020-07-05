class Phrase < ApplicationRecord
	acts_as_votable
	acts_as_taggable_on :topics

	validates :body, presence: true
	validates :user_id, presence: true


	scope :recent, -> { order(created_at: :desc) }
	scope :of_followed_users, -> (following_users) { where user_id: following_users}

	belongs_to :user
	has_many :comments, dependent: :destroy

end
