require 'rails_helper'

RSpec.feature "Creating a New Vendor" do 

	let!(:vendor) {FactoryGirl.create(:vendor)}

	before {visit new_vendor_path}

	scenario "works properly" do

		fill_in "vendor[name]", with: "New Vendor"
		fill_in "vendor[contact]", with: "New Contact"
		fill_in "vendor[contact_email]", with: "emailcontact@example.com"

		click_button "Add Vendor"

		within("div.flash p#success") do
			expect(page).to have_content("Vendor Successfully Entered")
		end
		expect(current_path).to eq vendors_path
	end

	scenario "requires that the Vendor have a name" do

		click_button "Add Vendor"
		within("div.flash p#warning") do
			expect(page).to have_content("Vendor Not Added" )
		end
		within("div.errors") do
			expect(page).to have_content("Name can't be blank")
		end
	end

	scenario "allows a blank email address" do

		fill_in "vendor[name]", with: "New Vendor"

		click_button "Add Vendor"

		expect(page).to have_content("Vendor Successfully Entered")
		expect(current_path).to eq vendors_path
	end

	scenario "requires a unique email address" do 

		fill_in "vendor[name]", with: "New Vendor"
		fill_in "vendor[contact_email]", with: vendor.contact_email

		click_button "Add Vendor"

		expect(page).to have_content("Vendor Not Added")
		within("div.errors") do
			expect(page).to have_content("Contact email has already been taken")
		end
	end

	scenario "rquires a unique Vendor name" do
		fill_in "vendor[name]", with: vendor.name
		click_button "Add Vendor"

		within("div.flash p#warning") do
			expect(page).to have_content("Vendor Not Added")
		end

		within("div.errors") do
			expect(page).to have_content("Name has already been taken")
		end
	end
end
