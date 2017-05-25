require 'rails_helper'

RSpec.feature "Creating a Certification" do

	before {visit new_certification_path}

	scenario "with the name" do

		fill_in "certification[name]", with: "New Certification"
		click_button "Add Certification"

		expect(page).to have_content("New Certification Added!")
		expect(page).to have_content("New Certification")
		expect(current_path).to eq certifications_path
	end

	scenario "without a name filled in" do

		click_button "Add Certification"

		expect(page).to have_content("New Certification Not Added!")
		expect(page).to have_content("2 errors prevented")
		expect(page).to have_content("Name can't be blank")
		expect(page).to have_content("Name is too short")
	end

	scenario "with a non unique name" do 

		Certification.create(name: "Test Certification")

		fill_in "certification[name]", with: "Test Certification"
		click_button "Add Certification"

		expect(page).to have_content("1 error prevented")
		expect(page).to have_content("Name has already been taken")
	end

	scenario "with a short name" do

		fill_in "certification[name]", with: "a" * 2
		click_button "Add Certification" 

		expect(page).to have_content("1 error prevented")
		expect(page).to have_content("Name is too short")
		expect(page).to have_content("minimum is 3 characters")
	end
end