require 'rails_helper'

RSpec.feature "Creating a certifier" do

	5.times do |n|
		let!("certification#{n}") {FactoryGirl.create(:certification)}
	end

	scenario "works properly" do

		visit new_certifier_path
		fill_in "certifier[organization]", with: "New Certifier"
		select "#{certification2.name}", from:  "certifier[certification_id]"
		click_button "Add Certifier"

		expect(page).to have_content("Certifier Successfully Created!")
		within("header") do
			expect(page).to have_content("New Certifier")
		end
		within("div#certification") do
			expect(page).to have_content certification2.name
		end

	end
end