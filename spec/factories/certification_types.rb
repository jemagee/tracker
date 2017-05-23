FactoryGirl.define do
  factory :certification_type do
    sequence(:name) {|n| "Cert Type #{n}"} 
  end
end
