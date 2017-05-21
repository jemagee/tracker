require "rails_helper"

RSpec.feature "Deleting an item" do

	let!(:item) {FactoryGirl.create(:item)}
	let!(:item2) {FactoryGirl.create(:item)}

	scenario "works properly" do

		visit item_path(item)
		click_link "Delete #{item.name}"

		expect(page).to have_content("Item Deleted Successfully")
		expect(page).to have_content(item2.name)
		expect(page).to_not have_content(item.name)
		expect(current_path).to eq items_path
	end
end