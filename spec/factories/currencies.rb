# == Schema Information
#
# Table name: currencies
#
#  id                :bigint(8)        not null, primary key
#  default_buy_rate  :integer
#  default_sale_rate :integer
#  name              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

FactoryGirl.define do
  factory :currency do
    name {Faker::Currency.name}
  end
end
