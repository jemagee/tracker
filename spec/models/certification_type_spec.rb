require 'rails_helper'

RSpec.describe CertificationType, type: :model do
  it{should validate_presence_of(:name)}
  it{should validate_length_of(:name).is_at_least(3)}
  it{should validate_uniqueness_of(:name).case_insensitive}
  it{should have_and_belong_to_many(:items)}
end
