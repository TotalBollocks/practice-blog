require 'spec_helper'

describe SessionsController do
  let(:user) {FactoryGirl.create :user}

  it "sets sessions user_id" do
    post 'create', username: user.username, password: user.password
    session[:user_id].should eq user.id
  end
  
  it "clear sessions user_id" do
    session[:user_id] = user.id
    delete 'destroy'
    session[:user_id].should be_nil
  end
end
