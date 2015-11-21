class Tape < ActiveRecord::Base
	belongs_to :user
	has_many :songs
	

	validates :description,  length: { maximum: 250 }
	validates :tapename,  length: { maximum: 20 }

	has_attached_file :tapepic, styles: { medium: "200x200>", thumb: "100x100>" }, :default_url => ActionController::Base.helpers.asset_path('purple_tape.jpg')	
	validates_attachment_content_type :tapepic, content_type: /\Aimage\/.*\Z/


end

