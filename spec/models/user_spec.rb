require 'spec_helper'

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
  
  it "can have an array of authored articles" do
    user = FactoryGirl.create :user
    article = FactoryGirl.build :article
    user.articles << article
    user.articles.should include article
  end
  
  it "can have a role" do
    user = FactoryGirl.create :user
    role = FactoryGirl.create :role
    user.roles << role
    user.roles.should include role
  end
end
