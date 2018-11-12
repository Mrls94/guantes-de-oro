# == Schema Information
#
# Table name: bills
#
#  id          :bigint(8)        not null, primary key
#  name        :string
#  quantity    :integer
#  value       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  cashier_id  :bigint(8)
#  currency_id :bigint(8)
#
# Indexes
#
#  index_bills_on_cashier_id   (cashier_id)
#  index_bills_on_currency_id  (currency_id)
#
# Foreign Keys
#
#  fk_rails_...  (cashier_id => cashiers.id)
#  fk_rails_...  (currency_id => currencies.id)
#

FactoryGirl.define do
  factory :bill do
    currency
    cashier
    name "MyString"
    value 1
    quantity 1
  end
end
