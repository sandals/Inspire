class Card < ActiveRecord::Base
	belongs_to :user

	attachment :image
end
