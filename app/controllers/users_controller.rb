class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			auto_login(@user)
			redirect_to root_path
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