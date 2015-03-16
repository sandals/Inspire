require "rails_helper"

feature "User can login" do
	scenario "with accurate credentials" do
		user = FactoryGirl.create(:user)

		visit root_path
		click_link "Login"

		fill_in "Email", with: user.email
		fill_in "Password", with: "password"
		click_button "Login"

		expect(page).to have_content(user.username)
	end

	scenario "with inaccurate credentials" do
		user = FactoryGirl.create(:user)

		visit root_path
		click_link "Login"

		fill_in "Email", with: user.email
		fill_in "Password", with: "incorrect_password"
		click_button "Login"

		expect(page).to have_content("Login failed")
	end
end
