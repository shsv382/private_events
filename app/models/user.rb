class User < ApplicationRecord
	before_save { self.email = email.downcase }
#	before_create :create_remember_token
	validates :name, length: { in: 2..50 }, 
					presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates 	:email, presence: true, 
				format: { with: VALID_EMAIL_REGEX }, 
				uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, length: { in: 6..16 }, confirmation: true
	has_many :created_events, class_name: "Event", foreign_key: "creator_id"

	def User.new_remember_token
	  SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
	  Digest::SHA1.hexdigest(token.to_s)
	end


end
