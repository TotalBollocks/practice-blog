require 'spec_helper'

describe "users" do
  let(:user) { FactoryGirl.create :user }
  
  specify "can create a user" do
    visit root_path
    click_link "Sign up"
    fill_in 'Email', with: 'lol@lol.com'
    fill_in 'Username', with: 'lolguy'
    fill_in 'Password', with: 'secure'
    fill_in 'Confirmation', with: 'secure'
    click_button "Sign up"
    page.should have_content "You have signed up"
  end
  
  specify "can sign in" do
    visit root_path
    click_link "Sign in"
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Sign in"
    page.should have_content "You have signed in!"
  end
  
  specify "can edit own profiles" do
    sign_in user
    click_link "My Profile"
    fill_in "Username", with: "NewName"
    click_button "Update"
    user.reload
    user.username.should eq "NewName"
    page.should have_content "Profile updated"
  end
end