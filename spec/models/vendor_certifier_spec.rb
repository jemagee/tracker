require 'rails_helper'

RSpec.describe VendorCertifier, type: :model do
  it {should belong_to(:vendor)}
  it {should belong_to(:certifier)}
end
