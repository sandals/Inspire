class User < ActiveRecord::Base
  authenticates_with_sorcery!

	validates_presence_of :username, :email, :password, :password_confirmation

	validates :password, confirmation: true
end
