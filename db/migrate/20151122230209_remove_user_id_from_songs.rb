class RemoveUserIdFromSongs < ActiveRecord::Migration
  def change
  	remove_column :songs, :user_id
  end
end
