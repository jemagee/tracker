require "rails_helper"

RSpec.feature "Adding a Certifier to An Exisiting Vendor" do

	let!(:vendor) {FactoryGirl.create(:vendor)}
	let!(:certification) {FactoryGirl.create(:certification)}
	3.times do |n|
		let!("certifier#{n}") {FactoryGirl.create(:certifier, certification: certification)}
	end

	before {visit edit_vendor_path(vendor)}

	scenario "works properly" do

		select certifier2.organization, from: "vendorcertifier[organization]"
		fill_in "vendorcertifier[expdate]", with: "12/31/2020"

		click_button "Update Vendor"

		expect(page).to have_content("Vendor Updated Successfully")
		within ("div#certifications") do
			expect(page).to have_content(certfier2.organization)
			expect(page).to have_content("12/31/2020")
			expect(page).to_not have_content(certifier1.organization)
		end
	end
end