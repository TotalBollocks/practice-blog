# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end
  
  factory :user do
    email
    username "User"
    password "secret"
    password_confirmation "secret"
  end
end
