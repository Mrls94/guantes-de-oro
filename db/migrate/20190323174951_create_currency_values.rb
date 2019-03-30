class CreateCurrencyValues < ActiveRecord::Migration[5.2]
  def change
    create_table :currency_values do |t|
      t.references :cashier, foreign_key: true
      t.references :currency, foreign_key: true
      t.integer :value, default: 0

      t.timestamps
    end
  end
end
