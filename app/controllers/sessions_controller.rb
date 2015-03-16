class SessionsController < ApplicationController
	skip_before_filter :require_login, only: [:new, :create]

	def new
		@user = User.new
	end

	def create
		if @user = login(params[:email], params[:password])
			redirect_back_or_to(root_path)
		else
			flash.now[:alert] = "Login failed"
			render action: "new"
		end
	end

	def destroy
		logout
		redirect_to(root_path, notice: "You have been logged out")
	end
end
