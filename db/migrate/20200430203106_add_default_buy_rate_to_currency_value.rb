class AddDefaultBuyRateToCurrencyValue < ActiveRecord::Migration[5.2]
  def change
    add_column :currency_values, :default_buy_rate, :integer, default: 0
    add_column :currency_values, :default_sale_rate, :integer, default: 0
  end
end
