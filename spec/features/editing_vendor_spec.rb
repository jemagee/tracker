require 'rails_helper'

RSpec.feature "Editing a Vendor" do

	let(:vendor) {FactoryGirl.create(:vendor)}
	let!(:vendor2) {FactoryGirl.create(:vendor)}

	scenario "works properly" do
		visit vendor_path(vendor)
		click_link "Edit Vendor"

		fill_in "vendor[name]", with: "Totally New Vendor Name"

		click_button "Update Vendor"

		expect(page).to have_content("Vendor Successfully Updated")
		expect(current_url).to eq vendor_url(vendor)
		within("div.vendor-name") do
			expect(page).to have_content("Totally New Vendor Name")
		end
	end
end