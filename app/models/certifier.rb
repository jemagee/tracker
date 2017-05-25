class Certifier < ApplicationRecord
  belongs_to :certification

  validates :organization, presence: true, uniqueness: {case_sensitive: false}, length: {minimum: 3}
end
