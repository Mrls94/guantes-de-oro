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

require 'rails_helper'

RSpec.describe Currency, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
