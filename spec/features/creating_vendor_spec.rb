require 'rails_helper'

RSpec.feature "Creating a New Vendor" do 

	scenario "works properly" do

		visit new_vendor_path

		fill_in "vendor[name]", with: "New Vendor"
		fill_in "vendor[contact]", with: "New Contact"
		fill_in "vendor[contact_email]", with: "emailcontact@example.com"

		click_button "Add Vendor"

		expect(page).to have_content("Vendor Successfully Entered")
		expect(current_path).to eq vendors_path
	end
end
