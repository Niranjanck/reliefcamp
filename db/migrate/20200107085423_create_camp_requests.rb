class CreateCampRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :camp_requests do |t|
      t.string :status
      t.string :quantity
      t.references :relief_camp, foreign_key: true
      t.references :item, foreign_key: true
      t.references :collection_center, foreign_key: true

      t.timestamps
    end
  end
end
