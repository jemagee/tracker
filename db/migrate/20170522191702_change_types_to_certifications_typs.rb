class ChangeTypesToCertificationsTyps < ActiveRecord::Migration[5.0]
  def change
  	rename_table :types, :certification_types
  end
end
