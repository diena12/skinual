FactoryBot.define do
  factory :user do
    name { 'TestUser' }
    email { |n| "tester#{n}@skinual.jp" }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
