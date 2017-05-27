require "rails_helper"

RSpec.feature "Editing a Certifier" do

	5.times do |n|
		let!("certification#{n}") {FactoryGirl.create(:certification)}
	end

	let!(:certifier) {FactoryGirl.create(:certifier, certification: certification0)}
	let!(:certifier2) {FactoryGirl.create(:certifier, certification: certification4)}

	before {visit edit_certifier_path(certifier)}

	scenario "Works properly" do

		fill_in "certifier[organization]", with: "Brand New Certifier Name"
		select certification3.name, from: "certifier[certification_id]"
		click_button "Update Certifier" 

		expect(page).to have_content("Certifier Updated Successfully!")
		expect(page).to have_content("Brand New Certifier Name")
		expect(page).to have_content(certification3.name)
		expect(page).to_not have_content(certification0.name)
	end

	scenario "Errors if organization is left blank" do

		fill_in "certifier[organization]", with: ""
		click_button "Update Certifier"

		expect(page).to have_content("Certifier Not Updated!")
		expect(page).to have_content("Organization can't be blank")
	end

	scenario "Errors if organization is too short" do

		fill_in "certifier[organization]", with: "WQ"
		click_button "Update Certifier"

		expect(page).to have_content("Certifier Not Updated!")
		expect(page).to have_content("too short")
		expect(page).to have_content("minimum is 3")
	end

	scenario "Errors if no certification type is selected" do
		
		select "Select Certification Type", from: "certifier[certification_id]"
		click_button "Update Certifier"

		expect(page).to have_content("Certifier Not Updated!")
		expect(page).to have_content("Certification can't be blank")
	end

	scenario "Errors is a duplicate name is entered" do

		fill_in "certifier[organization]", with: certifier2.organization
		click_button "Update Certifier"

		expect(page).to have_content("Certifier Not Updated!")
		expect(page).to have_content("Organization has already been taken")
	end
end