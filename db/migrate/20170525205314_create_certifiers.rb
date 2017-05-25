class CreateCertifiers < ActiveRecord::Migration[5.0]
  def change
    create_table :certifiers do |t|
      t.string :organization
      t.references :certification, foreign_key: true

      t.timestamps
    end
  end
end
