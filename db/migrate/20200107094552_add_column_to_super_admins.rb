class AddColumnToSuperAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :super_admins, :phone, :string
    add_index :super_admins, :phone, unique: true
  end
end
