require 'rails_helper'

RSpec.feature "Deleting a Vendor" do

	let!(:vendor) {FactoryGirl.create(:vendor)}
	let!(:vendor2) {FactoryGirl.create(:vendor)}

	before {visit vendor_path(vendor)}

	scenario "works properly" do

		click_link "Delete Vendor"

		expect(page).to have_content("Vendor Successfully Deleted")
		expect(page).to_not have_content(vendor.name)
		expect(page).to have_content(vendor2.name)
		expect(current_path).to eq vendors_path
	end
end