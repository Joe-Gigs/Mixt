class Tape < ActiveRecord::Base
	belongs_to :user
	has_many :songs, through: :mixtape
	


has_attached_file :song
validates_attachment_presence :song
validates_attachment_content_type :song, :content_type => [ 'audio/mp3','audio/mpeg']

validates :song, attachment_presence: true 

end
