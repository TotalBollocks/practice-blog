require 'spec_helper'

# Learn to make custom matchers..
RSpec::Matchers.define :permit do |*args|
  match do |permission|
    permission.permit?(*args).should be_true
  end
end

describe Permission, focus: true do
  context "as guest" do
    subject { Permission.new nil }
    it { should permit("welcome", "index") }
    it { should permit("subjects", "show") }
    it { should permit("articles", "show") }
    it { should permit("users", "new") }
    it { should permit("users", "create") }
    it { should permit("sessions", "new") }
    it { should permit("sessions", "create") }
    it { should permit("sessions", "destroy") }
  end
  
  context "as admin" do
    subject { Permission.new FactoryGirl.create(:user, admin: true) }
    it { should permit("any", "thing") }
  end
end