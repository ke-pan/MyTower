class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title, null: false
      t.text :description
      t.string :slug, null: false
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :todos, :slug, unique: true
  end
end
