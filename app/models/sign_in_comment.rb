class SignInComment < ApplicationRecord
  belongs_to :user
  belongs_to :cashier

  self.per_page = 10
end

# == Schema Information
#
# Table name: sign_in_comments
#
#  id                      :bigint(8)        not null, primary key
#  anomaly                 :boolean
#  cashier_currency_values :json
#  comment                 :string
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  cashier_id              :bigint(8)
#  user_id                 :bigint(8)
#
# Indexes
#
#  index_sign_in_comments_on_cashier_id  (cashier_id)
#  index_sign_in_comments_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (cashier_id => cashiers.id)
#  fk_rails_...  (user_id => users.id)
#
