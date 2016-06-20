class AddSubresourceToEvents < ActiveRecord::Migration
  def change
    add_column :events, :subresource, :string
    add_column :events, :subresource_path, :string
  end
end
