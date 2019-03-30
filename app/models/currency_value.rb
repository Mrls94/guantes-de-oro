class CurrencyValue < ApplicationRecord
  belongs_to :cashier
  belongs_to :currency

  validates :value, numericality: { greater_than_or_equal_to: 0, message: "No puede quedar en un numero negativo el monto" }
end

# == Schema Information
#
# Table name: currency_values
#
#  id          :bigint(8)        not null, primary key
#  value       :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  cashier_id  :bigint(8)
#  currency_id :bigint(8)
#
# Indexes
#
#  index_currency_values_on_cashier_id   (cashier_id)
#  index_currency_values_on_currency_id  (currency_id)
#
# Foreign Keys
#
#  fk_rails_...  (cashier_id => cashiers.id)
#  fk_rails_...  (currency_id => currencies.id)
#
