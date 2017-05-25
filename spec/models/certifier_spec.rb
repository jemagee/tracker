require 'rails_helper'

RSpec.describe Certifier, type: :model do
  it{should validate_presence_of(:organization)}
  it{should validate_uniqueness_of(:organization).case_insensitive}
  it{should validate_length_of(:organization).is_at_least(3)}
  it{should belong_to(:certification)}
end
