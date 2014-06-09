require 'spec_helper'

describe User do
  it "has valid factory", focus: true do
    user = FactoryGirl.build :user
    user.should be_valid
  end
end
