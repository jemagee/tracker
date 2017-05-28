class ChangeContactEmailToDefaultNil < ActiveRecord::Migration[5.0]
  def up
  	change_column :vendors, :contact_email, :text, default: nil
  end

  def down
  	change_column :vendor, :contact_email, :test
  end
end
