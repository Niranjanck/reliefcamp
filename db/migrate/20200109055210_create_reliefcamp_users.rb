class CreateReliefcampUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :reliefcamp_users do |t|
      t.string :name
      t.integer :age
      t.string :address
      t.string :gender
      t.string :phone

      t.timestamps
    end
  end
end
