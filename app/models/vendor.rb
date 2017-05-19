class Vendor < ApplicationRecord

	validates :name, presence: true, uniqueness: {case_sensitive: false}
	validates :contact_email, uniqueness: {case_sensitive: false}
end
