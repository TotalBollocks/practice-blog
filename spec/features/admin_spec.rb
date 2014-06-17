require 'spec_helper'

describe "admins", focus: true do
  let(:admin) { FactoryGirl.create :user, admin: true }
  let!(:user) { FactoryGirl.create :user }
  let!(:role) { FactoryGirl.create :role, name: "Author" }
  
  specify "can edit a users roles" do
    sign_in admin
    click_link "Users list"
    within "##{user.username.parameterize}" do
      click_link "Edit"
    end
    check "role_#{role.id}"
    click_button "Update User"
    user.should have_role "Author"
  end
end