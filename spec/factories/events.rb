FactoryBot.define do
  factory :event do
    association :user
    title { "BBQ test event #{rand(10)} " }
    address { "Moscow, Lomonosov str. #{rand(100)}" }
    datetime { Time.now + rand(10).days }
  end
end