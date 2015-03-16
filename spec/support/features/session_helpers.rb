module Features
	module SessionHelpers
		def login
			user = FactoryGirl.create(:user)
			visit new_session_path
			fill_in "Email", with: user.email
			fill_in "Password", with: "password"
			click_button "Login"
			visit root_path
		end
	end
end
