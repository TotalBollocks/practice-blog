require 'spec_helper'

describe "admins", focus: true do
  let(:admin) { FactoryGirl.create :user, admin: true }
  let!(:user) { FactoryGirl.create :user }
  let!(:role) { FactoryGirl.create :role, name: "Author" }
  
  specify "can give a user a role" do
    sign_in admin
    click_link "Users list"
    within "##{user.username.parameterize}" do
      click_link "Edit"
    end
    check "role_#{role.id}"
    click_button "Update User"
    user.should have_role "Author"
  end
  
  specify "can remove a role from user" do
    user.roles << role
    sign_in admin
    click_link "Users list"
    within "##{user.username.parameterize}" do
      click_link "Edit"
    end
    uncheck "role_#{role.id}"
    click_button "Update User"
    user.should_not have_role "Author"
  end
end