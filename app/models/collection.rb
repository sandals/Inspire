class Collection < ActiveRecord::Base
	belongs_to :user

	has_many :cards
	has_many :collaborators

	validates :title, presence: true
end
