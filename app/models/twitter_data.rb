class TwitterData < ActiveRecord::Base
	# Relationship
	belongs_to :company

	#Validations
	validates_date :data_date
	validates_numericality_of :favorites, greater_than_or_equal_to: 0, only_integer: true
	validates_numericality_of :retweets, greater_than_or_equal_to: 0, only_integer: true
	validates_numericality_of :followers, greater_than_or_equal_to: 0, only_integer: true
	validates_numericality_of :polarity, greater_than_or_equal_to: 0

	#Scopes
	scope :by_retweets, -> { order(:retweets) }
	scope :by_followers, -> { order(:followers) }
	scope :chronological, -> { order(data_date: :desc) }

	#methods?


end
