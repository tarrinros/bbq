FactoryBot.define do
  factory :user do
    name {"Alex_#{rand(999)}"}

    sequence(:email) { |n| "somebody_#{n}@mail.ru?"}

    after(:build) { |u| u.password_confirmation = u.password = 'dottle-nouveau-pavilion-tights-furze'}
  end
end