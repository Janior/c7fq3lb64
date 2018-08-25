class ExpensesController < ApplicationController
	before_action :authenticate_user!	

	  def index

		user = User.find(current_user.id)
	    @expenses = user.expenses.order("date DESC")


	# @expenses = Expense.order("date DESC")


	        if (params[:concept].present?)
	            @expenses =@expenses.where("concept like :query",query: "%#{params[:concept]}%")
	        end
	        if (params[:category_id].present?)
	           @expenses= @expenses.where(category_id: params[:category_id])
	        end

	        if params[:concept].present?
	           @expenses = @expenses.where("concept LIKE ?", "%#{params[:concept]}%")
	        end
	  end
end
