class TypesController < ApplicationController
  before_action :authenticate_user!
  def new
    @type = Type.new
  end

  def index
    @types = Type.where(user_id: current_user.id)
  end

  def show
    @type = Type.find_by(id: params[:id])
    @expenses = @type.expenses.where(user_id: current_user.id)
    @budget = @type.budget
    @total = @expenses.sum(:amount)
    redirect_to root_path if @type.user_id != current_user.id
  end

  def create
    @type = current_user.types.build(type_params)

    respond_to do |format|
      if @type.save
        format.html { redirect_to root_path, notice: 'type was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def type_params
    params.require(:type).permit(:name, :icon, :budget, :user_id)
  end
end
