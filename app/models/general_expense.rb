class GeneralExpense < ApplicationRecord
  belongs_to :user
  belongs_to :cashier

  def deduct_from_cashier
    new_value = cashier.value_colombia - value
    cashier.update(value_colombia: new_value)
  end
end

# == Schema Information
#
# Table name: general_expenses
#
#  id          :bigint(8)        not null, primary key
#  description :string
#  value       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  cashier_id  :bigint(8)
#  user_id     :bigint(8)
#
# Indexes
#
#  index_general_expenses_on_cashier_id  (cashier_id)
#  index_general_expenses_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (cashier_id => cashiers.id)
#  fk_rails_...  (user_id => users.id)
#
