require 'rails_helper'

RSpec.feature "Deleting a Certification type" do

	let!(:type1) {FactoryGirl.create(:certification_type)}
	let!(:type2) {FactoryGirl.create(:certification_type, name: "This is type 2")}

	scenario "works properly" do

		visit certification_types_path
		click_link type2.name
		click_link "Delete #{type2.name}"

		expect(page).to have_content("Certification Type Successfully Deleted!")
		expect(page).to have_content(type1.name)
		expect(page).to_not have_content(type2.name)
		expect(current_path).to eq certification_types_path
	end
end