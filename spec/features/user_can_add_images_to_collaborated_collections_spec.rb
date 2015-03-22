require "rails_helper"

feature "User can add images to collaborated collections" do
	scenario "adding cards", js: true do
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
		create_card_for_collection("Dank Memes", "feels good man")

		expect(page).to have_content("feels good man")
	end
end
