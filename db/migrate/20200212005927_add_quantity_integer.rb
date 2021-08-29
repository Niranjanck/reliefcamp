class AddQuantityInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :camp_items, :quantity, :integer
    change_column :camp_requests, :quantity, :integer
    change_column :center_items, :quantity, :integer
    change_column :center_requests, :quantity, :integer
  end
end
