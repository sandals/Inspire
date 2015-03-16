class Dashboard::DashboardController < ApplicationController
	def index
		@collections = current_user.collections.all
		@cards = current_user.cards.all
	end
end
