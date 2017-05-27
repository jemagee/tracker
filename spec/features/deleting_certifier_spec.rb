require "rails_helper"

RSpec.feature "Deleting a Certifier" do 

	let!(:certification) {FactoryGirl.create(:certification)}
	3.times do |n|
		let!("certifier#{n}") {FactoryGirl.create(:certifier, certification: certification)}
	end

	scenario "works properly" do

		visit certifier_path(certifier1)

		click_link "Delete #{certifier1.organization}"

		expect(page).to have_content("Certifier Deleted")
		expect(current_path).to eq certifiers_path
		expect(page).to have_content(certifier0.organization)
		expect(page).to_not have_content(certifier1.organization)
	end
end