class AddColumnToCollectionCenterAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :collection_center_admins, :phone, :string
    add_index :collection_center_admins, :phone, unique: true
  end
end
