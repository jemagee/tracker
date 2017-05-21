require "rails_helper" 

RSpec.feature "Creating an item" do

	scenario "Entering the item name" do

		visit new_item_path
		fill_in "item[name]", with: "New Item Name"
		click_button "Add Item"

		expect(page).to have_content("Item Successfully Created!")
		within("h1") do
			expect(page).to have_content("New Item Name")
		end

	end
end