class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :content

      t.timestamps
    end
    add_index :links, :content
  end
end
