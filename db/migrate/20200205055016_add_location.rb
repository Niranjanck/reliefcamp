class AddLocation < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :address, :text
    add_column :users, :latitude, :float
    add_column :users, :longitude, :float
    add_column :collection_centers, :address, :text
    add_column :collection_centers, :latitude, :float
    add_column :collection_centers, :longitude, :float
    add_column :relief_camps, :address, :text
    add_column :relief_camps, :latitude, :float
    add_column :relief_camps, :longitude, :float
  end
end
