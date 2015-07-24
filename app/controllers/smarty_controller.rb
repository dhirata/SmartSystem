class SmartyController < ApplicationController
	before_action :set_smarty, only: [:show, :edit, :update, :destroy]


	private
	def set_smarty
		@smarty = Smarty.find(params[:id])
	end

	def item_params
    	params.require(:smarty).permit(:customer_id, :description, :analysis, :company_id)
  	end
end
