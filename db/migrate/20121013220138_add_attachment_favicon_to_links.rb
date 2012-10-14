class AddAttachmentFaviconToLinks < ActiveRecord::Migration
  def self.up
    change_table :links do |t|
      t.has_attached_file :favicon
    end
  end

  def self.down
    drop_attached_file :links, :favicon
  end
end
