class User < ApplicationRecord
	acts_as_voter

	validates :username, presence: true, length: { minimum: 4, maximum: 12 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :phrases
end
