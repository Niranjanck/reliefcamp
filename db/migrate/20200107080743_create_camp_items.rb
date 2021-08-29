class CreateCampItems < ActiveRecord::Migration[5.2]
  def change
    create_table :camp_items do |t|
      t.string :quantity
      t.references :relief_camp, foreign_key: true
      t.references :item, foreign_key: true

      t.timestamps
    end
  end
end
