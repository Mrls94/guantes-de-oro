class CreateUserCashiers < ActiveRecord::Migration[5.2]
  def change
    create_table :user_cashiers do |t|
      t.references :user, foreign_key: true
      t.references :cashier, foreign_key: true

      t.timestamps
    end
  end
end
