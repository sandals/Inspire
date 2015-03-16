module Features
	module SessionHelpers
		def login
			user = FactoryGirl.create(:user)
			visit new_session_path
			fill_in "Email", with: user.email
			fill_in "Password", with: "password"
			click_button "Login"
			# user should land on dashboard path
		end
	end
end
