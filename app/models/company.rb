class Company < ActiveRecord::Base
	#relationships
	belongs_to :smarty

	#validations
	validates_presence_of :ticker, :name


end
