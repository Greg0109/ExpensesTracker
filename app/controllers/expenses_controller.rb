class ExpensesController < ApplicationController
  def new
    @expense = Expense.new
  end
  
  def create
    @expense = current_user.expenses.build(expense_params)

    respond_to do |format|
      if @expense.save
        format.html { redirect_to root_path, notice: 'expense was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private
  def expense_params
    params.require(:expense).permit(:name, :amount, :user_id)
  end
end
