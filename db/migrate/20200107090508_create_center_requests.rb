class CreateCenterRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :center_requests do |t|
      t.string :status
      t.string :quantity
      t.references :item, foreign_key: true
      t.references :collection_center, foreign_key: true

      t.timestamps
    end
  end
end
