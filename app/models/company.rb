class Company < ActiveRecord::Base
	#relationships
	has_many :financial_data
	has_many :twitter_data
	has_one :smarty

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

	def current_financial_data
		return self.financial_data.chronological.first
	end

	def current_twitter_data
		return self.twitter_data.chronological.first
	end
end
