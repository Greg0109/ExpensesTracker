class CreateTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :types do |t|
      t.string :name
      t.datetime :date
      t.string :icon

      t.timestamps
    end
  end
end
