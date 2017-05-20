require "rails_helper"

RSpec.feature "Viewing the vendor index page" do

	let!(:vendor) {FactoryGirl.create(:vendor)}
	let!(:vendor2) {FactoryGirl.create(:vendor)}

	scenario "has links to the vendors" do

		visit vendors_path

		expect(page).to have_link vendor.name
		expect(page).to have_link vendor2.name
	end
end