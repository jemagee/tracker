class CreateJoinTableCertificationItem < ActiveRecord::Migration[5.0]
  def change
  	drop_join_table :certification_types, :items
    create_join_table :certifications, :items do |t|
       t.index [:certification_id, :item_id]
       t.index [:item_id, :certification_id]
    end
  end
end
