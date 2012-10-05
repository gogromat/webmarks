class AddUriFieldToLinks < ActiveRecord::Migration
  def change
    add_column :links, :uri, :string
    add_index :links, :uri
  end
end
