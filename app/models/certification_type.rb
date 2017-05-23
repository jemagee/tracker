class CertificationType < ApplicationRecord

	validates :name, presence: true, length: {minimum: 3}, uniqueness: {case_sensitive: false}
end
