require 'rails_helper'

RSpec.feature "Editing a certification type" do
	let!(:certtype) {FactoryGirl.create(:certification_type)}

	before do 
		visit certification_types_path 
		click_link "#{certtype.name}"
		click_link "Edit #{certtype.name}"
	end

	scenario "Works properly" do

		fill_in "certification_type[name]", with: "Totally New Name"
		click_button "Update Certification Type"

		expect(page).to have_content("Certification Type Successfully Updated!")
		expect(current_path).to eq certification_type_path(certtype)
	end

	scenario "Fails properly with a blank name" do

		fill_in "certification_type[name]", with: ""
		click_button "Update Certification Type"

		expect(page).to have_content("2 errors prevented this Certification type from being entered")
		expect(page).to have_content("Name can't be blank")
		expect(page).to have_content("Name is too short")
		expect(page).to have_content("minimum is 3 characters")
	end
end