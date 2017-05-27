require "rails_helper"

RSpec.feature "Editing a Certifier" do

	5.times do |n|
		let!("certification#{n}") {FactoryGirl.create(:certification)}
	end

	let!(:certifier) {FactoryGirl.create(:certifier, certification: certification0)}

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
end