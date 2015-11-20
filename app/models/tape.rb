class Tape < ActiveRecord::Base
	belongs_to :user
	# has_many :songs


has_attached_file :song

# def check_file
# 	if is_image_type?
#       {:large => "750x750>", :medium => "300x300#", :thumb => "100x100#" }
# 	else is_audio_type?
# 	{
#         :audio => {
#           :format => "mp3"
#         }
#       }
# end

# end

# def is_audio_type?
has_attached_file :song
validates_attachment_content_type :song, :content_type => [ 'audio/mp3','audio/mpeg']
# end

# def is_image_type?
# has_attached_file :song, styles: { medium: "200x200>", thumb: "100x100>" }, :default_url => ActionController::Base.helpers.asset_path('purple_tape.jpg')	
# validates_attachment_content_type :song, content_type: /\Aimage\/.*\Z/

# end

end