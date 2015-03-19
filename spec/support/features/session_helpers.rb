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

		def login_as_collaborator
			collaborator = FactoryGirl.create(:collaborator)
			visit new_session_path
			fill_in "Email", with: collaborator.email
			fill_in "Password", with: "password"
			click_button "Login"
		end

		def logout
			visit dashboard_root_path
			click_link "Logout"
		end
	end
end
