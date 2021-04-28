class AddTypesToExpenses < ActiveRecord::Migration[6.1]
  def change
    add_reference :expenses, :types, foreign_key: true
  end
end
