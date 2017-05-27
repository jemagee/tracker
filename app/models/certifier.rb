class Certifier < ApplicationRecord
  belongs_to :certification
  has_many :vendor_certifiers
  has_many :vendors, through: :vendor_certifiers

  validates :organization, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3}
  validates :certification, presence: true
end
