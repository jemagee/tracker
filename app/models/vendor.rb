class Vendor < ApplicationRecord

	has_many :vendor_certifiers
	has_many :certifiers, through: :vendor_certifiers

	validates :name, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 4}
	validates :contact_email, uniqueness: {case_sensitive: false}
end
