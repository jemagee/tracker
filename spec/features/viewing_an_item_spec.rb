require "rails_helper"

RSpec.describe "Viewing an individual Item" do

	let!(:item) {FactoryGirl.create(:item)}
	let!(:item2) {FactoryGirl.create(:item)}

	scenario "Works from the items index page" do

		visit items_path
		click_link item2.name
		expect(page).to have_content(item2.name)
		expect(current_path).to eq item_path(item2)
		expect(page).to_not have_content(item.name)
	end
end