FactoryBot.define do
  factory :user do
    name {"Alex_#{rand(999)}"}

    sequence(:email) { |n| "tester#{n}@example.com" }

    after(:build) { |u| u.password_confirmation = u.password = 'dottle-nouveau-pavilion-tights-furze'}

    # trait :with_generated_name do
    #   before(:validation) { |project| create_list(:note, 5, project: project) }
    # end
  end
end