require 'spec_helper'

describe Role do
  it "has valid factory" do
    role = FactoryGirl.build :role
    role.should be_valid
  end
  
  it "requires a name" do
    role = FactoryGirl.build :role, name: ""
    role.should have_error :name, "can't be blank"    
  end
  
  it "can have a list of users" do
    role = FactoryGirl.create :role
    user = FactoryGirl.create :user
    role.users << user
    role.users.should include user
  end
end
