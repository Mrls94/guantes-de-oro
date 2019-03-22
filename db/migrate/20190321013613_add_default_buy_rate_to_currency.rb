class AddDefaultBuyRateToCurrency < ActiveRecord::Migration[5.2]
  def change
    add_column :currencies, :default_buy_rate, :integer
    add_column :currencies, :default_sale_rate, :integer
  end
end
