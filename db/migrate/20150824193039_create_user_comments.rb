class CreateUserComments < ActiveRecord::Migration
  def change
    create_table :user_comments do |t|
      t.integer :user_id, null: false
      t.text :comment, null: false

      t.timestamps null: false
    end
    add_index :user_comments, :user_id
  end
end
