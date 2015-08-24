class AddAuthorColumns < ActiveRecord::Migration
  def change
    add_column :user_comments, :author_id, :integer, null: false
    add_column :goal_comments, :author_id, :integer, null: false
  end
end
