FactoryGirl.define do
  factory :vendor do
    sequence(:name) {|n| "Vendor Name#{n}"} 
    contact "Test Vendor Contact"
    sequence(:contact_email) {|n| "vendor#{n}_contact@example.com"}
  end
end
