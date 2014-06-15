require 'spec_helper'
RSpec::Matchers.define :have_error do |error, message|
  match do |user|
    user.should_not be_valid
    user.errors[error].include? message
  end
end


describe User do
  it "has valid factory" do
    user = FactoryGirl.build :user
    user.should be_valid
  end
  
  it "requires email" do
    user = FactoryGirl.build :user, email: ""
    user.should have_error :email, "can't be blank"
  end
  
  it "must have unique email" do
    FactoryGirl.create :user, email: "taken@taken.com"
    user = FactoryGirl.build :user, email: "taken@taken.com"
    user.should have_error :email, "has been taken"
  end
  
  it "requires a username" do
    user = FactoryGirl.build :user, username: ""
    user.should have_error :username, "can't be blank"
  end
end
