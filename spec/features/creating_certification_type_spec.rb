require 'rails_helper'

RSpec.feature "Creating a Certification Type" do

	scenario "with the name" do

		visit new_type_path
		fill_in "type[name]", with: "New Certification Type"
		click_button "Add Certification Type"

		expect(page).to have_content("New Certification Type Added!")
		expect(page).to have_content("New Certification Type")
		expect(current_path).to eq types_path
	end
end