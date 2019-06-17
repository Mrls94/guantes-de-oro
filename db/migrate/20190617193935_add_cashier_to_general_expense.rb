class AddCashierToGeneralExpense < ActiveRecord::Migration[5.2]
  def change
    add_reference :general_expenses, :cashier, foreign_key: true, index: true
  end
end
