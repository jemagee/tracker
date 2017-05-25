require "rails_helper" 

RSpec.feature "Creating an item" do

	3.times do |n| 
		let!("cert#{n}") {FactoryGirl.create(:certification)}
	end

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
		within("div.errors") do
			within ("div.error-count") do
				expect(page).to have_content("1 error prevented this Item from being entered")
			end
			expect(page).to have_content("Name has already been taken")
		end
	end

	scenario "With a name less than four letters" do

		fill_in "item[name]", with: "a" * 3
		click_button "Add Item"

		expect(page).to have_content("Item Not Created!")
		expect(page).to have_content("Name is too short")
	end

	scenario "Assigning Cerrtification" do

		fill_in "item[name]", with: "New Item Name"
		check  "#{cert2.name}"
		click_button "Add Item"

		expect(page).to have_content("Item Successfully Created!")
		within("h1") do 
			expect(page).to have_content("New Item Name")
		end
		within("div#certtypes") do
			expect(page).to have_content("1 Certification")
			within("ul#types") do
				expect(page).to have_content(cert2.name)
				expect(page).to_not have_content(cert1.name)
			end
		end
	end
end