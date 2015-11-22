class RemoveColumnUserIdFromSongs < ActiveRecord::Migration
  def change
  	remove column :user_id, :songs
  end
end
