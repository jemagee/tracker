FactoryGirl.define do
  factory :certifier do
    sequence(:organization) {|n| "Organization#{n}"} 
    certification nil
  end
end
