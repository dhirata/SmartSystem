class Customer < ActiveRecord::Base
	# Relationships
	has_many :smarties
	belongs_to :user

	# Scopes
	scope :alphabetical,  -> { order(:last_name).order(:first_name) }
	scope :active,        -> { where(active: true) }
	scope :inactive,      -> { where(active: false) }

	validates_presence_of :first_name, :last_name
	validates_format_of :phone, with: /\A(\d{10}|\(?\d{3}\)?[-. ]\d{3}[-.]\d{4})\z/, message: "should be 10 digits (area code needed) and delimited with dashes only"
  	validates_format_of :email, with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, message: "is not a valid format"

  	
end
