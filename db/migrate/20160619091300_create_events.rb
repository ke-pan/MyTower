class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :project_name, null: false
      t.string :project_path, null: false
      t.string :resource_name, null: false
      t.string :resource_path, null: false
      t.string :description, null: false
      t.string :user_name, null: false
      t.string :user_path, null: false
      t.references :user, index: true, foreign_key: true
      t.references :team, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :events, :created_at
  end
end
