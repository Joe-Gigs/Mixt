class User < ActiveRecord::Base
	has_many :tapes
	# has_many :songs, through: :mixtape

	attr_accessor :password_salt
	attr_accessor :password_hash
	
	before_validation :normalize_username, on: :create
	before_save :encrypt_password

	has_attached_file :avatar, styles: { medium: "200x200>", thumb: "100x100>" }, :default_url => ActionController::Base.helpers.asset_path('pink_tape.jpg')	
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  	validates_uniqueness_of :username
	validates :password, confirmation: true, presence: true, length: { minimum: 5 }
	validates :username, presence: true, length: { maximum: 15 }
	validates_presence_of :username, :fname, :lname, :password, :avatar

	protected
		 def encrypt_password
		 	  if password.present?
	     		 self.password_salt = BCrypt::Engine.generate_salt
	     		 self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
	 		 end
		 end

		 def normalize_username
	      self.username = self.username.downcase
	    end
end

