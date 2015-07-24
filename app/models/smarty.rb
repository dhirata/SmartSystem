class Smarty < ActiveRecord::Base
	#relationships
	belongs_to :customer
	has_many :companies

	#validations
	validates_inclusion_of :analysis, :in => %w[buy sell stay], message: "not a recommendation"
end
