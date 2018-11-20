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

FactoryGirl.define do
  factory :cashier do
    comment {Faker::RickAndMorty.quote}
    concept {Faker::RickAndMorty.quote}
    name {Faker::RickAndMorty.quote}
    place {Faker::RickAndMorty.quote}
  end
end
