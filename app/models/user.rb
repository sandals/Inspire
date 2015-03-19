class User < ActiveRecord::Base
	before_save :normalize_email

	has_many :cards
	has_many :collections

  authenticates_with_sorcery!

	validates_presence_of :username, :email, :password, :password_confirmation

	validates :username, uniqueness: true
	validates :email, uniqueness: true
	validates :password, confirmation: true

	def permitable_collections
		permitable = []
		permitable.push(self.collections)
		
		collaborating = Collaborator.where(username: self.username)
		collaborating.each do |collaborator|
			permitable.push(Collection.where(id: collaborator.collection_id))
		end

		permitable.uniq.flatten
	end

	private

	def normalize_email
		self.email.downcase!
	end
end
