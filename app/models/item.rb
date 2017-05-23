class Item < ApplicationRecord

	has_and_belongs_to_many :certification_types
	
	validates :name, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 4}
end
