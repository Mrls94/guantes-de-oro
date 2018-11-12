class Cashier < ApplicationRecord
  has_many :user_cashiers
  has_many :users, through: :user_cashiers

  def total_money_for(name_of_currency)
    7
  end
end

# == Schema Information
#
# Table name: cashiers
#
#  id         :bigint(8)        not null, primary key
#  comment    :string
#  concept    :string
#  name       :string
#  place      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
