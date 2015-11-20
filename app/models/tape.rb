class Tape < ActiveRecord::Base
	belongs_to :user
	has_many :songs, through: :mixtape
	


has_attached_file :song
validates_attachment_presence :song
validates_attachment_content_type :song, :content_type => [ 'audio/mp3','audio/mpeg']

has_attached_file :tapepic, styles: { medium: "200x200>", thumb: "100x100>" }, :default_url => ActionController::Base.helpers.asset_path('purple_tape.jpg')	
validates_attachment_content_type :tapepic, content_type: /\Aimage\/.*\Z/


end
