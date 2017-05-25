require 'rails_helper'

RSpec.feature "Viewing a A Certficiation Type" do

	let!(:certification) {FactoryGirl.create(:certification)}

	scenario "Displays properly" do

		visit certification_path(certification)

		within("div.header") do
			expect(page).to have_content certification.name
		end
	end
end