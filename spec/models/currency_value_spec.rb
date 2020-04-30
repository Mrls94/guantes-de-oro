# == Schema Information
#
# Table name: currency_values
#
#  id                :bigint(8)        not null, primary key
#  default_buy_rate  :integer          default(0)
#  default_sale_rate :integer          default(0)
#  value             :integer          default(0)
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  cashier_id        :bigint(8)
#  currency_id       :bigint(8)
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

require 'rails_helper'

RSpec.describe CurrencyValue, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
