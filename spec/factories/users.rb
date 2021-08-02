FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    trait :newly_registered

    trait :with_names do
      first_name { Faker::Name.first_name}
      last_name { Faker::Name.last_name}
    end

    trait :invalid do
      email { nil }
      password { 123 } #must be atleast 6 characters
      first_name { 222 } #must be alphabetical if present
      last_name { 707 } #same as first_name
    end
  end
end
