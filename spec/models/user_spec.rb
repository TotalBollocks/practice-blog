require 'spec_helper'

RSpec::Matchers.define :have_email do |email|
  match do |user|
    user.email.should == email
  end
end

describe User do
  it "has valid factory" do
    user = FactoryGirl.build :user
    user.should be_valid
  end
end
