require "rails_helper"

feature "User can create cards" do
	scenario "without logging in" do
		visit new_dashboard_card_path
		expect(page).to have_content("Register or Login")
	end

	scenario "minimum required properties", js: true do
		login

		click_on "New card"
		attach_file "Image", File.join(Rails.root, '/spec/support/files/test.jpg')
		click_button "Save card"

		expect(page).to have_css(".card img")
	end
end
