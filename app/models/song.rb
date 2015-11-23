class Song < ActiveRecord::Base
     belongs_to :tape
     belongs_to :user, class_name: :user, foreign_key: :user_id
	 has_attached_file :song,
	 					:path => ":rails_root/app/assets/audios/:filename",
	 					:url  => "/songs/:id/:filename",
	 					:default_url => "/assets/audios"

	 validates_attachment_presence :song
	 validates_attachment_content_type :song, :content_type => [ 'audio/mp3','audio/mpeg']
	 validates_attachment_size :song, :less_than => 10.megabytes, 
	    :message => 'filesize must be less than 10 MegaBytes' 
end
