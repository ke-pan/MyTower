class CreateAccesses < ActiveRecord::Migration
  def change
    create_table :accesses do |t|
      t.references :user, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true
      t.boolean :owned, default: false, null: false
      t.timestamps null: false
    end
  end
end
