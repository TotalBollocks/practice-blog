# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :title do |n|
    "Article#{n}"
  end
  factory :article do
  	title
  	summary "A summary of the article"

  	subject
    user
  end
end
