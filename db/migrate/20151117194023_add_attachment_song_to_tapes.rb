class AddAttachmentSongToTapes < ActiveRecord::Migration
  def self.up
    change_table :tapes do |t|
      t.attachment :song
    end
  end

  def self.down
    remove_attachment :tapes, :song
  end
end
