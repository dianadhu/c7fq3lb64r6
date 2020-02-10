class ExpensesController < ApplicationController
  def index
    user_session = current_user.id
    #@expenses = Expense.order("date DESC")
    @expenses = if params[:concept] && params[:category_id]
     Expense.where(user_id: user_session).where('concept LIKE ?',"%#{params[:concept]}%").
     where('category_id LIKE ?',"%#{params[:category_id]}%")
    else
     @expense = Expense.where(user_id: user_session).order('date DESC')
     # @expenses = Expense.order("date DESC")
   end
  end
end
