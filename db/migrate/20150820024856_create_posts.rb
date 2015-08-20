class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.text :message
      t.integer :post_type_id
      t.integer :post_parent_id

      t.timestamps
    end
  end
end
