FactoryBot.define do
  factory :comment do
    association :event
    association :user

    body { "Here is a comment ##{rand(100)}" }
  end
end
