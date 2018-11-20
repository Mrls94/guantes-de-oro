class Session < ApplicationRecord
  belongs_to :user
  belongs_to :cashier
end

# == Schema Information
#
# Table name: sessions
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cashier_id :bigint(8)
#  user_id    :bigint(8)
#
# Indexes
#
#  index_sessions_on_cashier_id  (cashier_id)
#  index_sessions_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (cashier_id => cashiers.id)
#  fk_rails_...  (user_id => users.id)
#
