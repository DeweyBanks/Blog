FactoryBot.define do

  factory :user do
    sequence(:name) { |n| "test#{n}" }
    sequence(:email) { |n| "test#{n}@test.com" }
    sequence(:password) { |n| "blah1234"}
    sequence(:password_confirmation) { |n| "blah1234"}
  end
end
