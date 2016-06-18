class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.references :todo, index: true, foreign_key: true
      t.string :slug

      t.timestamps null: false
    end
    add_index :comments, :slug, unique: true
  end
end
