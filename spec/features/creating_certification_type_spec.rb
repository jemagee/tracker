require 'rails_helper'

RSpec.feature "Creating a Certification Type" do

	before {visit new_certification_type_path}

	scenario "with the name" do

		fill_in "certification_type[name]", with: "New Certification Type"
		click_button "Add Certification Type"

		expect(page).to have_content("New Certification Type Added!")
		expect(page).to have_content("New Certification Type")
		expect(current_path).to eq certification_types_path
	end

	scenario "without a name filled in" do

		click_button "Add Certification Type"

		expect(page).to have_content("New Certification Type Not Added!")
		expect(page).to have_content("2 errors prevented")
		expect(page).to have_content("Name can't be blank")
		expect(page).to have_content("Name is too short")
	end

	scenario "with a non unique name" do 

		CertificationType.create(name: "Test Type")

		fill_in "certification_type[name]", with: "Test Type"
		click_button "Add Certification Type"

		expect(page).to have_content("1 error prevented")
		expect(page).to have_content("Name has already been taken")
	end

	scenario "with a short name" do

		fill_in "certification_type[name]", with: "a" * 2
		click_button "Add Certification Type" 

		expect(page).to have_content("1 error prevented")
		expect(page).to have_content("Name is too short")
		expect(page).to have_content("minimum is 3 characters")
	end
end