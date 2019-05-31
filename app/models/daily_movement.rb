class DailyMovement < ApplicationRecord
  belongs_to :user
  belongs_to :currency
  belongs_to :cashier

  enum action: { compra: 0, venta: 1 }

  validates :value_colombia, presence: {message: "Valor de precio en peso colombiano no puede estar vacio"}
  validates :value_foreign, presence: {message: "Valor de precio en divisa no puede estar vacio" }
  validates :action, presence: true
  validates :exchange_rate, presence: true
  validates :user_id, presence: true
  validates :cashier_id, presence: true
  validates_with CashierCurrencyValueValidator

  self.per_page = 10

  def deduct_from_cashier
    if compra?
      old_cashier_value = cashier.value_colombia
      new_cashier_value = old_cashier_value - value_colombia
      cashier.update(value_colombia: new_cashier_value)

      old_cashier_value_divisa = cashier.total_money_for(currency)
      new_cashier_value_divisa = old_cashier_value_divisa + value_foreign
      cashier.currency_values.find_or_initialize_by(currency: currency).update(value: new_cashier_value_divisa)
    else
      old_cashier_value = cashier.total_money_for(currency)
      new_cashier_value = old_cashier_value - value_foreign
      cashier.currency_values.find_or_initialize_by(currency: currency).update(value: new_cashier_value)

      old_cashier_value_colombia = cashier.value_colombia
      new_cashier_value_colombia = old_cashier_value_colombia + value_colombia
      cashier.update(value_colombia: new_cashier_value_colombia)
    end
  end
end

# == Schema Information
#
# Table name: daily_movements
#
#  id             :bigint(8)        not null, primary key
#  action         :integer
#  exchange_rate  :integer
#  value_colombia :integer
#  value_foreign  :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  cashier_id     :bigint(8)
#  currency_id    :bigint(8)
#  user_id        :bigint(8)
#
# Indexes
#
#  index_daily_movements_on_cashier_id   (cashier_id)
#  index_daily_movements_on_currency_id  (currency_id)
#  index_daily_movements_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (cashier_id => cashiers.id)
#  fk_rails_...  (currency_id => currencies.id)
#  fk_rails_...  (user_id => users.id)
#
