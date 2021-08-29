class AddColumnToInformationAdmins < ActiveRecord::Migration[5.2]
  def change
    add_column :information_admins, :phone, :string
    add_index :information_admins, :phone, unique: true
  end
end
