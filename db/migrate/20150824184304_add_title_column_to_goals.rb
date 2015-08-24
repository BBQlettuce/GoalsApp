class AddTitleColumnToGoals < ActiveRecord::Migration
  def change
    add_column :goals, :title, :string, null: false
    add_index :goals, :title
  end
end
