class AddUserIdToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :user_id, :integer
    add_index :todos, :user_id
    add_foreign_key :todos, :users
  end
end
