# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :article do
  	title "The Article"
  	summary "A summary of the article"

  	subject
  end
end
