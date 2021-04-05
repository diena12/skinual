FactoryBot.define do
  factory :user do
    name { 'TestUser' }
    email { |n| "tester#{n}@skinual.jp" }
    password { 'password' }
    password_confirmation { 'password' }
    skin_type { '乾燥肌' }
    profile { '初めまして。' }
  end
end
