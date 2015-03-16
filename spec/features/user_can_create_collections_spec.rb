require "rails_helper"

feature "User can create collections" do
	scenario "creating a new collection" do
		login

		create_collection("Dank Memes")

		expect(page).to have_content("Dank Memes")
	end
end
