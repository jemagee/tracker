class RenameCertificationTypeToCertification < ActiveRecord::Migration[5.0]
  def change
  	rename_table :certification_types, :certifications
  end
end
