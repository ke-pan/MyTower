class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.string :slug, null: false

      t.timestamps null: false
    end
    add_index :teams, :slug, unique: true
  end
end
