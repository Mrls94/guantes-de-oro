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

require 'rails_helper'

RSpec.describe DailyMovement, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
