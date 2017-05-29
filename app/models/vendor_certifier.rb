class VendorCertifier < ApplicationRecord
  belongs_to :vendor
  belongs_to :certifier

  def date_display
  	expires_on.strftime('%-m/%-d/%y')
  end

  def expires_on=(expiry)
  	write_attribute(:expires_on, Date.strptime(expiry, '%m/%d/%y'))
  end
end
