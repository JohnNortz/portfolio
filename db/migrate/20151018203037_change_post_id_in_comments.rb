class ChangePostIdInComments < ActiveRecord::Migration
  def change
    remove_column :comments, :user_id, :integer
    remove_column :comments, :post_id, :integer

    change_table :comments do |t|
      t.integer :user_id
      t.integer :post_id
      t.index :user_id
      t.index :post_id
    end
  end
end
