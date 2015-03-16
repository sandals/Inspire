module Features
	module CardHelpers
		def create_collection(title)
			visit dashboard_root_path

			click_link "New collection"
			fill_in "Title", with: title
			click_button "Create collection"
		end
	end
end
