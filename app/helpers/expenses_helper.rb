module ExpensesHelper
  def get_type_name(type_id)
    type_name = Type.where(id: type_id)
    type_name.first.name
  end
end
