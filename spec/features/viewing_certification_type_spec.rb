require 'rails_helper'

RSpec.feature "Viewing a A Certficiation Type" do

	let!(:certtype) {FactoryGirl.create(:certification_type)}

	scenario "Displays properly" do

		visit certification_type_path(certtype)

		within("div.header") do
			expect(page).to have_content certtype.name
		end
	end
end