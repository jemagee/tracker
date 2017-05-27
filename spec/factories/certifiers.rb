FactoryGirl.define do
  factory :certifier do
    sequence(:organization) {|n| "Organication#{n}"} 
    certification nil
  end
end
