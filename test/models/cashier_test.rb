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

require 'test_helper'

class CashierTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
