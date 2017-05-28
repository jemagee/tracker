require "rails_helper"

RSpec.feature "Adding a Certifier to An Exisiting Vendor" do

	let!(:vendor) {FactoryGirl.create(:vendor)}
	let!(:certification) {FactoryGirl.create(:certification)}
	3.times do |n|
		let!("certifier#{n}") {FactoryGirl.create(:certifier, certification: certification)}
	end

	before {visit edit_vendor_path(vendor)}

	scenario "works properly" do

		select certifier2.organization, from: "vendor[vendor_certifiers_attributes][0][certifier_id]"
		fill_in "vendor[vendor_certifiers_attributes][0][expires_on]", with: "12/31/2020"

		
		click_button "Update Vendor"

		expect(page).to have_content("Vendor Successfully Updated!")
		within ("div#certifications") do
			expect(page).to have_content(certifier2.organization)
			expect(page).to have_content("12/31/2020")
			expect(page).to_not have_content(certifier1.organization)
			expect(page).to have_content(certification.name)
		end
	end
end