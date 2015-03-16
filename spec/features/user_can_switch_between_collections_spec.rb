require "rails_helper"

feature "User can switch between collections" do
	scenario "collections should be listed on dashboard index" do
		login

		create_collection("Dank Memes")
		create_collection("Dankest Memes")
		create_collection("LOL CATS")

		visit dashboard_root_path
		click_link "LOL CATS"
		visit dashboard_root_path
		click_link "Dank Memes"

		expect(page).to have_content("Dank Memes")
	end
end
