require 'rails_helper'

RSpec.feature "Editing a certification type" do
	let!(:certification) {FactoryGirl.create(:certification)}

	before do 
		visit certifications_path 
		click_link "#{certification.name}"
		click_link "Edit #{certification.name}"
	end

	scenario "Works properly" do

		fill_in "certification[name]", with: "Totally New Name"
		click_button "Update Certification"

		expect(page).to have_content("Certification Successfully Updated!")
		expect(current_path).to eq certification_path(certification)
	end

	scenario "Fails properly with a blank name" do

		fill_in "certification[name]", with: ""
		click_button "Update Certification"

		expect(page).to have_content("2 errors prevented this Certification from being entered")
		expect(page).to have_content("Name can't be blank")
		expect(page).to have_content("Name is too short")
		expect(page).to have_content("minimum is 3 characters")
	end
end