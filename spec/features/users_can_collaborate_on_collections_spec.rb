require "rails_helper"

feature "Users can collaborate on collections", js: true do
	scenario "sharing a collection" do
		collabo = FactoryGirl.build(:collaborator)

		login
		create_collection("Dank Memes")
		create_card_for_collection("Dank Memes")

		click_link "Add friend to collection"
		fill_in "Username", with: collabo.username
		click_button "Add friend"

		expect(page).to have_content("Friend added to collection")
	end

	scenario "collaborating on a collection", js: true do
		collabo = FactoryGirl.build(:collaborator)

		login
		create_collection("Dank Memes")
		create_card_for_collection("Dank Memes")

		click_link "Add friend to collection"
		fill_in "Username", with: collabo.username
		click_button "Add friend"

		logout
		login_as_collaborator

		click_on "Dank Memes"

		expect(page).to have_content("Dank Memes")
		expect(page).to have_css(".card img")
	end
end
