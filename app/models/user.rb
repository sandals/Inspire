class User < ActiveRecord::Base
	before_save :normalize_email

	has_many :cards

  authenticates_with_sorcery!

	validates_presence_of :username, :email, :password, :password_confirmation

	validates :username, uniqueness: true
	validates :email, uniqueness: true
	validates :password, confirmation: true

	private

	def normalize_email
		self.email.downcase!
	end
end
