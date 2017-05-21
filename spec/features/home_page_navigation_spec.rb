require 'rails_helper'

RSpec.feature "The home page layout" do

	before {visit root_path}

	scenario "Has the brand logo" do

		within ("a.navbar-brand") do
			expect(page).to have_content "Certification Tracker"
		end
	end

	scenario "The Brand logo goes to the root page" do

		click_link "Certification Tracker"

		expect(current_path).to eq root_path
	end

	scenario "There should be links to the Inventory and Item" do

		within("ul.navbar-nav") do
			expect(page).to have_content("Items")
			expect(page).to have_content("Vendors")
		end
	end
end