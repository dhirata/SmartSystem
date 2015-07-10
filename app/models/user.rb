class User < ActiveRecord::Base
	# Use built-in rails support for password protection
  	has_secure_password

  	# Relationships
  	has_one :customer


	# Validations
	validates :username, presence: true, uniqueness: { case_sensitive: false}
	validates_inclusion_of :role, :in => %w[admin customer], message: "is not a recognized role in system"
	validates_presence_of :password, on: :create 
	validates_presence_of :password_confirmation, on: :create 
	validates_confirmation_of :password, on: :create, message: "does not match"
	validates_length_of :password, minimum: 4, message: "must be at least 4 characters long", allow_blank: true

	
end
