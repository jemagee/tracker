class CreateJoinTableCertificationTypesItems < ActiveRecord::Migration[5.0]
  def change
    create_join_table :certification_types, :items do |t|
      # t.index [:certification_type_id, :item_id]
      # t.index [:item_id, :certification_type_id]
    end
  end
end
