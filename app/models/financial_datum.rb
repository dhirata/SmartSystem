class FinancialDatum < ActiveRecord::Base
	#relationship
	belongs_to :company

	#validations
	validates_date :data_date
	validates_numericality_of :stock_price, greater_than_or_equal_to: 0

	#scopes
	scope :chronological, -> { order(data_date: :desc) }
	scope :for_date, ->(date) { where("data_date == ?", date) }

	#methods		

end
