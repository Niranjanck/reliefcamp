class AddColumnToReliefCampAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :relief_camp_admins, :phone, :string
    add_index :relief_camp_admins, :phone, unique: true
  end
end
