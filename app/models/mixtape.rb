class Mixtape < ActiveRecord::Base
	belongs_to :user
	has_many :songs

 has_attached_file :song
 validates_attachment_presence :song
 validates_attachment_content_type :song, :content_type => [ 'audio/mp3','audio/mpeg']
end
