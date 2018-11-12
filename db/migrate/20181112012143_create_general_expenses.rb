class CreateGeneralExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :general_expenses do |t|
      t.references :user, foreign_key: true
      t.integer :value
      t.string :description

      t.timestamps
    end
  end
end
