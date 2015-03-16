require "rails_helper"

feature "User can logout" do
	scenario "when logged in" do
		login		

		visit root_path
		click_link "Logout"

		expect(page).to have_content("You have been logged out")
	end
end
