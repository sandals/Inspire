class Dashboard::DashboardController < ApplicationController
	def index
		@collections = current_user.permitable_collections
		@cards = current_user.cards.all
	end
end
