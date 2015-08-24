class RenameCommentColumn < ActiveRecord::Migration
  def change
    rename_column :user_comments, :comment, :body
    rename_column :goal_comments, :comment, :body
  end
end
