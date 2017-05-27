class VendorCertifier < ApplicationRecord
  belongs_to :vendor
  belongs_to :certifier
end
