FactoryGirl.define do
  factory :cashier do
    comment {Faker::RickAndMorty.quote}
    concept {Faker::RickAndMorty.quote}
    name {Faker::RickAndMorty.quote}
    place {Faker::RickAndMorty.quote}
  end
end
