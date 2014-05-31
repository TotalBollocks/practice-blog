require 'spec_helper'

describe Article do
  it "Has valid factory" do
  	article = FactoryGirl.build(:article)
  	article.should be_valid
  end

  it "requires subject" do
  	article = FactoryGirl.build(:article, subject: nil)
  	article.should_not be_valid
  	article.errors[:subject].should include("can't be blank")
  end
end
