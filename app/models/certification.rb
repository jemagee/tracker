class Certification < ApplicationRecord

	has_and_belongs_to_many :items

	validates :name, presence: true, length: {minimum: 3}, uniqueness: {case_sensitive: false}
end
