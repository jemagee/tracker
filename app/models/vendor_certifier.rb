class VendorCertifier < ApplicationRecord
  belongs_to :vendor
  belongs_to :certifier

  def date_display
  	expires_on.strftime('%-m/%-d/%y')
  end
end
