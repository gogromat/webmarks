class CreateLinkages < ActiveRecord::Migration
  def change
    create_table :linkages do |t|
      t.integer :user_id
      t.integer :link_id
      t.integer :order

      t.timestamps
    end

    add_index :linkages, :user_id
    add_index :linkages, :link_id
    add_index :linkages, [:user_id, :link_id], unique: true
  end
end
