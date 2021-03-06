class UsersController < ApplicationController
	skip_before_filter :require_login, only: [:new, :create]

	layout "static"

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			auto_login(@user)
			redirect_to dashboard_root_path
		else
			flash.now[:error] = "Could not create account."
			render action: "new"
		end
	end

	private

	def user_params
		params.require(:user).permit(:username, :email, :password, :password_confirmation)
	end
end
