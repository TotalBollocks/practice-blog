require 'spec_helper'

# Learn to make custom matchers..
RSpec::Matchers.define :permit do |*args|
  match do |permission|
    permission.permit?(*args).should be_true
  end
end

describe Permission, focus: true do
  let(:user) { FactoryGirl.create :user }
  
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
    let(:other_user) { FactoryGirl.create :user, email: "dif@dif.com", username: "Diffy" }
    subject { Permission.new(user) }
    
    it { should_not permit "users", "edit" }
    it { should_not permit "users", "update" }
    it { should_not permit "users", "edit", other_user }
    it { should_not permit "users", "update", other_user }
    it { should permit "users", "edit", user }
    it { should permit "users", "update", user }
  end
  
  context "as author" do
    let(:author) { FactoryGirl.build :role, name: "Author" }
    let(:user_article) { FactoryGirl.create :article, user: user }
    let(:other_article) { FactoryGirl.create :article }
    subject { Permission.new(user) }
    before do
      user.roles << author
    end
    
    it { should permit "articles", "new" }
    it { should permit "articles", "create" }
    it { should permit "articles", "edit", user_article }
    it { should permit "articles", "update", user_article }
    it { should permit "articles", "destroy", user_article }
    it { should_not permit "articles", "edit", other_article }
    it { should_not permit "articles", "update", other_article }
    it { should_not permit "articles", "destroy", other_article }
  end
  
  context "as admin" do
    subject { Permission.new FactoryGirl.create(:user, admin: true) }
    it { should permit("any", "thing") }
  end
end