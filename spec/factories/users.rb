# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :email do |n|
    "user#{n}@example.com"
  end
  
  sequence :username do |n|
    "User#{n}"
  end
  
  factory :user do
    email
    username
    password "secret"
    password_confirmation "secret"
  end
end
