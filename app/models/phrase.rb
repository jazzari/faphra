class Phrase < ApplicationRecord

	validates :body, presence: true

	scope :recent, -> { order(created_at: :desc) }

end
