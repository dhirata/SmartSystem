class Company < ActiveRecord::Base
	#relationships
	belongs_to :smarty

	#validations
	validates_presence_of :ticker, :name

	#scopes
	scope :active,        -> { where(active: true) }
	scope :inactive,      -> { where(active: false) }
	scope :by_name,       -> { order(:name) }
	scope :by_ticker,     -> { order(:ticker) }

	#method
	def display_ticker
		"#{ticker}".capitalize
	end
end
