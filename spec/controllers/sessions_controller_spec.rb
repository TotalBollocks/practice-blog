require 'spec_helper'

describe SessionsController do

  it "sets sessions user_id" do
     user = FactoryGirl.create :user
     post  'create', email: user.email, password: user.password
     session[:user_id].should eq user.id
  end
  
  it "clear sessions user_id" do
    session[:user_id] = 5
    get 'destroy'
    session[:user_id].should be_nil
  end
end
