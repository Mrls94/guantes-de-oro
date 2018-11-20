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

require 'rails_helper'

RSpec.describe Cashier, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"


  describe '#total_money_for' do
    let(:cashier){ FactoryGirl.create :cashier }
    let(:currency){ FactoryGirl.create :currency }
    let(:bill_1){FactoryGirl.create :bill, currency: currency, cashier: cashier, value: 1, quantity: 2 }
    let(:bill_2){FactoryGirl.create :bill, currency: currency, cashier: cashier, value: 5, quantity: 1 }

    it 'should return total money value' do

      expect(cashier.reload.total_money_for(currency.name)).to eql 7
    end

  end
end
