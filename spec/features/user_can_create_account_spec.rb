require "rails_helper"

feature "User can create account" do
	scenario "registering with valid information" do
		visit root_path
		click_link "Register"

		fill_in "Username", with: "1337h4ck3r"
		fill_in "Email", with: "a@t.co"
		fill_in "Password", with: "1337H4cK3r!1"
		fill_in "Verify Password", with: "1337H4cK3r!1"
		click_button "Register"

		expect(page).to have_content("1337h4ck3r")
	end

	scenario "with missing information" do
		visit root_path
		click_link "Register"

		fill_in "Username", with: ""
		fill_in "Email", with: "a@t.co"
		fill_in "Password", with: "1337H4cK3r!1"
		fill_in "Verify Password", with: "1337H4cK3r!1"
		click_button "Register"

		expect(page).to have_content("Could not create account.")
	end
end
