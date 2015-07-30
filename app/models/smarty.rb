class Smarty < ActiveRecord::Base
	#relationships
	belongs_to :customer
	belongs_to :company

	#validations
	validates_inclusion_of :analysis, :in => %w[buy sell stay], message: "not a recommendation"

	#scope
	scope :chronological, -> { order(timestamp: :desc) }
	
	#methods
end
