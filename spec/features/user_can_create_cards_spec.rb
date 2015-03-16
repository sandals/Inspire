require "rails_helper"

feature "User can create cards" do
	scenario "without logging in" do
		visit new_card_path
		expect(page).to have_content("Register or Login")
	end

	scenario "minimum required properties" do
		login
		visit root_path

		click_on "New Card"
		attach_file "Image", File.join(Rails.root, '/spec/support/files/test.jpg')
		click_button "Save Card"

		expect(page).to have_css(".card img")
	end
end