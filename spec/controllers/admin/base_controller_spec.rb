require 'spec_helper'

describe Admin::BaseController do
  controller(Admin::BaseController) do
    
    def index
      render text: "Success!"
    end
  end
  
  it "Rejects if not signed in" do
    get "index"
    response.should redirect_to root_path
  end
  
  it "Rejects an anonymous user" do
    user = FactoryGirl.create :user
    session[:user_id] =  user.id
    get "index"
    response.should redirect_to root_path
  end
  
  it "Allows an admin access" do
    user = FactoryGirl.create :user, admin: true
    session[:user_id] = user.id
    get "index"
    response.should be_success
  end
end