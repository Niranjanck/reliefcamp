class CreateCollectionCenters < ActiveRecord::Migration[5.2]
  def change
    create_table :collection_centers do |t|
      t.string :center_name
      t.string :description
      t.string :phone

      t.timestamps
    end
  end
end
