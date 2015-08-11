class HomeController < ApplicationController
	def home
		@nav_flag = true
		@smarties = Smarty.chronological.paginate(page: params[:page]).per_page(25)
		@companies = Company.by_name.paginate(page: params[:page]).per_page(25)
		@company_count = @companies.size
		@filter_company_params = Set.new
		@filter_category_params = Set.new
		@all_options = ["Buy", "Sell", "Hold"]
		@all_categories = ["Product", "Executive", "Acquisition"]
	end

	def login
		@nav_flag = false
	end

	def filterCompany
		@smarties = Smarty.appl.paginate(page: params[:page]).per_page(25)
		@companies = Company.by_name.paginate(page: params[:page]).per_page(25)
		@company_count = @companies.size
		@filter_company_params = Set.new
		@filter_company_params.add("Apple")
		@filter_category_params = Set.new
		@all_options = ["Buy", "Sell", "Hold"]
		@all_categories = ["Product", "Executive", "Acquisition"]
	end

	def filterCategory
		@smarties = Smarty.appl.product.paginate(page: params[:page]).per_page(25)
		@companies = Company.by_name.paginate(page: params[:page]).per_page(25)
		@company_count = @companies.size
		@filter_company_params = Set.new
		@filter_company_params.add("Apple")
		@filter_category_params = Set.new
		@filter_category_params.add("Product")
		@all_options = ["Buy", "Sell", "Hold"]
		@all_categories = ["Product", "Executive", "Acquisition"]
	end

	def about
	end

	def privacy
	end

	def contact
	end
end
