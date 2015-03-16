class Collection < ActiveRecord::Base
	belongs_to :user

	has_many :cards

	validates :title, presence: true
end
