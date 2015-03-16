class StaticPagesController < ApplicationController
	skip_before_filter :require_login, only: [:index]

	layout 'static'

	def index
	end
end
