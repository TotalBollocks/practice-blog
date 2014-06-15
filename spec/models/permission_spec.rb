require 'spec_helper'

# Learn to make custom matchers..
RSpec::Matchers.define :permit do |*args|
  match do |permission|
    permission.permit?(*args).should be_true
  end
end

describe Permission, focus: true do
  describe "base permissions" do
    subject { Permission.new nil }
    it { should permit("welcome", "index") }
    it { should permit("subjects", "show") }
    it { should permit("articles", "show") }
    it { should permit("users", "new") }
    it { should permit("users", "create") }
    it { should permit("sessions", "new") }
    it { should permit("sessions", "create") }
    it { should permit("sessions", "destroy") }
    
    it { should_not permit("anything", "else") }
  end
  
  describe "user permissions" do
    let(:user) { FactoryGirl.create :user }
    let(:other_user) { FactoryGirl.create :user, email: "dif@dif.com", username: "Diffy" }
    subject { Permission.new(user) }
    
    it { should_not permit "users", "edit" }
    it { should_not permit "users", "update" }
    it { should_not permit "users", "edit", other_user }
    it { should_not permit "users", "update", other_user }
    it { should permit "users", "edit", user }
    it { should permit "users", "update", user }
  end
  
  context "as admin" do
    subject { Permission.new FactoryGirl.create(:user, admin: true) }
    it { should permit("any", "thing") }
  end
end