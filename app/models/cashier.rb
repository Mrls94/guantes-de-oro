class Cashier < ApplicationRecord
  has_many :user_cashiers
  has_many :users, through: :user_cashiers
  has_many :daily_movements
  has_many :currency_values
  has_one :session

  accepts_nested_attributes_for :currency_values#, reject_if: ->(attributes){ attributes['value'] < 0 }
  validates :value_colombia, numericality: { greater_than_or_equal_to: 0, message: "No puede quedar en un numero negativo el monto" }

  scope :no_session, ->{where('cashiers.id not in (select cashier_id from sessions)')}

  def total_money_for(currency)
    currency_value = currency_values.where(currency: currency).first
    if currency_value
      currency_value.value
    else
      0
    end
  end
end

# == Schema Information
#
# Table name: cashiers
#
#  id             :bigint(8)        not null, primary key
#  comment        :string
#  concept        :string
#  name           :string
#  place          :string
#  value_colombia :integer          default(0)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
