class Phrase < ApplicationRecord
	acts_as_votable

	validates :body, presence: true
	validates :user_id, presence: true

	scope :recent, -> { order(created_at: :desc) }

	belongs_to :user

end
