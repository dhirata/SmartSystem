class SmartyController < ApplicationController
	before_action :set_smarty, only: [:show, :edit, :update, :destroy]

	def index
		@smarties = Smarty.order("created_at").paginate(page: params[:page]).per_page(25)
	end

	private
	def set_smarty
		@smarty = Smarty.find(params[:id])
	end

	def item_params
    	params.require(:smarty).permit(:customer_id, :description, :analysis, :company_id)
  	end
end
