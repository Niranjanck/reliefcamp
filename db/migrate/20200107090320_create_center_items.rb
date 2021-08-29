class CreateCenterItems < ActiveRecord::Migration[5.2]
  def change
    create_table :center_items do |t|
      t.string :quantity
      t.references :collection_center, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
