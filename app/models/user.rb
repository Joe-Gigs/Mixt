class User < ActiveRecord::Base
	has_many :tapes
	# has_many :songs, through: :mixtape


	has_attached_file :avatar, styles: { medium: "200x200>", thumb: "100x100>" }, :default_url => ActionController::Base.helpers.asset_path('pink_tape.jpg')	
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  	# validates :avatar, attachment_presence: true
end

