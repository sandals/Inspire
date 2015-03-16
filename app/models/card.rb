class Card < ActiveRecord::Base
	belongs_to :user
	belongs_to :collection

	validates :collection, presence: true

	attachment :image
end
