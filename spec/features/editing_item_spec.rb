require "rails_helper"

RSpec.feature "Editing an Item" do

	let!(:item) {FactoryGirl.create(:item)}

	before do
		visit item_path(item)
		click_link "Edit #{item.name}"
	end

	scenario "Works properly" do

		fill_in "item[name]", with: "New Item Name"
		click_button "Update Item"

		expect(page).to have_content("Item Updated Successfully!")
		expect(page).to have_content("New Item Name")
		expect(current_path).to eq item_path(item)
	end
end