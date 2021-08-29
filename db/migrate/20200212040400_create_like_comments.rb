class CreateLikeComments < ActiveRecord::Migration[5.2]
  def change
    create_table :like_comments do |t|
      t.boolean :like
      t.text :comment
      t.references :parent, polymorphic: true

      t.timestamps
    end
  end
end
