FactoryBot.define do
  factory :comment do
    association :event
    association :user

    body { "Here is a comment ##{rand(100)}" }

    user_name { "Commentator #{rand(10)}" }
  end
end
