class Dashboard::DashboardController < ApplicationController
	def index
		@cards = current_user.cards.all
	end
end
