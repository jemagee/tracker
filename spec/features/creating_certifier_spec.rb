require 'rails_helper'

RSpec.feature "Creating a certifier" do

	5.times do |n|
		let!("certification#{n}") {FactoryGirl.create(:certification)}
	end

	let!(:certifier) {FactoryGirl.create(:certifier, certification: certification3)}

	before {visit new_certifier_path}

	scenario "works properly" do

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

	scenario "presents error with blank name" do

		select "#{certification4.name}", from: "certifier[certification_id]"
		click_button "Add Certifier"

		expect(page).to have_content("Certifier Not Created!")

		within("div.errors") do
			expect(page).to have_content ("Organization can't be blank")
		end
	end

	scenario "Presents error with short name" do

		fill_in "certifier[organization]", with: "QQ"
		select "#{certification3.name}", from: "certifier[certification_id]"
		click_button "Add Certifier"

		expect(page).to have_content("Certifier Not Created!")
		expect(page).to have_content("Organization is too short")
		expect(page).to have_content("minimum is 3 characters")
	end

	scenario "Presents error when you don't select a certification type" do

		fill_in "certifier[organization]", with: "QAI"
		click_button "Add Certifier"

		expect(page).to have_content("Certifier Not Created!")
		expect(page).to have_content("Certification can't be blank")
	end

	scenario "Presents error when a duplication organization name is entered" do

		fill_in "certifier[organization]", with: certifier.organization
		select "#{certification3.name}", from: "certifier[certification_id]"
		click_button "Add Certifier"

		expect(page).to have_content("Certifier Not Created!")
		expect(page).to have_content("has already been taken")
	end
end