class AddUniqueIndexToUserCashier < ActiveRecord::Migration[5.2]
  def change
    add_index :user_cashiers, [:user_id, :cashier_id], unique: true
  end
end
