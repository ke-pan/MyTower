class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :slug, null: false
      t.references :team, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :projects, :slug, unique: true
  end
end
