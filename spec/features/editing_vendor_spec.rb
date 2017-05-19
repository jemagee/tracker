require 'rails_helper'

RSpec.feature "Editing a Vendor" do

	let(:vendor) {FactoryGirl.create(:vendor)}
	let!(:vendor2) {FactoryGirl.create(:vendor)}

	before do
		visit vendor_path(vendor)
		click_link "Edit Vendor"
	end

	scenario "works properly" do

		fill_in "vendor[name]", with: "Totally New Vendor Name"

		click_button "Update Vendor"

		expect(page).to have_content("Vendor Successfully Updated")
		expect(current_url).to eq vendor_url(vendor)
		within("div.vendor-name") do
			expect(page).to have_content("Totally New Vendor Name")
		end
	end

	scenario "fails appropriately with bad company name" do

		fill_in "vendor[name]", with: vendor2.name
		click_button "Update Vendor"

		expect(page).to have_content("Vendor Not Updated")
		expect(page).to have_content("Name has already been taken")
		expect(current_url).to_not eq vendor_path(vendor)
	end

	scenario "fails appropriate with non-non unique email" do

		fill_in "vendor[contact_email]", with: vendor2.contact_email
		click_button "Update Vendor"
		expect(page).to have_content("Contact email has already been taken")
	end
end