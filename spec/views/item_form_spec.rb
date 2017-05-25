require 'rails_helper'

RSpec.describe "items/new" do

	3.times do |n|
		let!("type#{n}") {FactoryGirl.create(:certification)}
	end

	

	it "has all the certification_types as check options" do
		@item = Item.new
		render

		expect(rendered).to match "item_certification_ids_#{type0.id}"
		expect(rendered).to match "item_certification_ids_#{type1.id}"
		expect(rendered).to match "item_certification_ids_#{type2.id}"
	end

end