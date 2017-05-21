require "rails_helper" 

RSpec.feature "Creating an item" do

	before {visit new_item_path}

	scenario "Entering the item name" do

		fill_in "item[name]", with: "New Item Name"
		click_button "Add Item"

		expect(page).to have_content("Item Successfully Created!")
		within("h1") do
			expect(page).to have_content("New Item Name")
		end

	end

	scenario "With no name" do

		click_button "Add Item"

		expect(page).to have_content("Item Not Created!")
		expect(page).to have_content("Name can't be blank")
	end

	scenario "With non-unique name" do
		Item.create(name: "Test Item")

		fill_in "item[name]", with: "TESt ItEm"
		click_button "Add Item"

		expect(page).to have_content("Item Not Created!")
		expect(page).to have_content("Name has already been taken")
	end
end