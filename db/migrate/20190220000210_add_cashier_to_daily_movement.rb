class AddCashierToDailyMovement < ActiveRecord::Migration[5.2]
  def change
    add_reference :daily_movements, :cashier, foreign_key: true
  end
end
