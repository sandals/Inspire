module Features
	module CardHelpers
		def create_collection(title)
			visit dashboard_root_path

			click_link "New collection"
			fill_in "Title", with: title
			click_button "Create collection"
		end

		def create_card_for_collection(collection_name, card_title="")
			visit dashboard_root_path
			click_link collection_name
			click_link "New card"
			fill_in "Title", with: card_title if card_title
			attach_file "Image", File.join(Rails.root, '/spec/support/files/test.jpg')
			click_button "Save card"
		end
	end
end
