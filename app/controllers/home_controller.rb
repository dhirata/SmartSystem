class HomeController < ApplicationController
	def home
		@smarties = Smarty.chronological.paginate(page: params[:page]).per_page(25)
		@companies = Company.by_name.paginate(page: params[:page]).per_page(25)
		@company_count = @companies.size
	end

	def about
	end

	def privacy
	end

	def contact
	end
end
