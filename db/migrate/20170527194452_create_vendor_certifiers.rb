class CreateVendorCertifiers < ActiveRecord::Migration[5.0]
  def change
    create_table :vendor_certifiers do |t|
      t.references :vendor, foreign_key: true
      t.references :certifier, foreign_key: true
      t.date :expires_on

      t.timestamps
    end
  end
end
