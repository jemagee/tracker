require 'rails_helper'

RSpec.feature "Viewing a certifier" do

	let!(:certification) {FactoryGirl.create(:certification)}
	let!(:certifier) {FactoryGirl.create(:certifier, certification: certification)}

	scenario "Displays the Content Properly" do

		visit certifier_path(certifier)

		within("header h1") do
			expect(page).to have_content(certifier.organization)
		end

		within("div#certification") do
			expect(page).to have_content certification.name
		end
	end
end
