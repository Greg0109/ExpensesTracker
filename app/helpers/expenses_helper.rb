module ExpensesHelper
    def get_group_name(type_id)
        group_name = Type.where(:id => type_id)
        group_name.first.name
    end
end
