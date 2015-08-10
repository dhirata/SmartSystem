class Smarty < ActiveRecord::Base
	#relationships
	belongs_to :customer
	belongs_to :company

	#validations
	validates_inclusion_of :analysis, :in => %w[buy sell hold], message: "not a recommendation"

	#scope
	scope :chronological, -> { order(timestamp: :desc) }
	scope :appl, -> { where(company_id: 2)}
	scope :product, -> { where(category: "Product") }
	#methods
end
