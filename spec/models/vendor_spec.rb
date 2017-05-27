require 'rails_helper'

RSpec.describe Vendor, type: :model do
  it {should validate_presence_of(:name)}
  it {should validate_uniqueness_of(:name).case_insensitive}
  it {should validate_uniqueness_of(:contact_email).case_insensitive}
  it {should validate_length_of(:name).is_at_least(4)}
  it {should have_many(:vendor_certifiers)}
  it {should have_many(:certifiers).through(:vendor_certifiers)}
end
