FactoryBot.define do

  factory :user do
    sequence(:name) { |n| "test#{n}" }
    sequence(:email) { |n| "test#{n}@test.com" }
    password "blah1234"
    password_confirmation "blah1234"
  end
end
