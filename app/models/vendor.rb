class Vendor < ApplicationRecord

	validates :name, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 4}
	validates :contact_email, uniqueness: {case_sensitive: false}
end
