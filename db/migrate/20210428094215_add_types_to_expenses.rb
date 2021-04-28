class AddTypesToExpenses < ActiveRecord::Migration[6.1]
  def change
    add_reference :expenses, :type, foreign_key: true
  end
end
