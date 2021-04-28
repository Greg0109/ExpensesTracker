class AddUserToTypes < ActiveRecord::Migration[6.1]
  def change
    add_reference :types, :user, null: false, foreign_key: true
  end
end
