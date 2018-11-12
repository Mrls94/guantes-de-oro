class GeneralExpense < ApplicationRecord
  belongs_to :user
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
#  user_id     :bigint(8)
#
# Indexes
#
#  index_general_expenses_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
