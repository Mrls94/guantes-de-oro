# == Schema Information
#
# Table name: user_cashiers
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cashier_id :bigint(8)
#  user_id    :bigint(8)
#
# Indexes
#
#  index_user_cashiers_on_cashier_id              (cashier_id)
#  index_user_cashiers_on_user_id                 (user_id)
#  index_user_cashiers_on_user_id_and_cashier_id  (user_id,cashier_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (cashier_id => cashiers.id)
#  fk_rails_...  (user_id => users.id)
#

require 'test_helper'

class UserCashierTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
