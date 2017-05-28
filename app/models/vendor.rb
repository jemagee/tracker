class Vendor < ApplicationRecord

	has_many :vendor_certifiers, inverse_of: :vendor
	has_many :certifiers, through: :vendor_certifiers

	accepts_nested_attributes_for :vendor_certifiers, reject_if: lambda {|attributes| attributes["certifier_id"].blank?}

	validates :name, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 4}
	validates :contact_email, uniqueness: {case_sensitive: false}
end
