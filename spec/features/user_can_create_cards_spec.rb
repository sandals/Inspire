require "rails_helper"

feature "User can create cards" do
	scenario "can not create card without logging in" do
		visit new_dashboard_collection_card_path(1)
		expect(page).to have_content("Register or Login")
	end

	scenario "minimum required properties", js: true do
		login
		create_collection("Dank Memes")

		click_link "New card"
		attach_file "Image", File.join(Rails.root, '/spec/support/files/test.jpg')
		click_button "Save card"

		expect(page).to have_content("Dank Memes")
		expect(page).to have_css(".card img")
	end
end
