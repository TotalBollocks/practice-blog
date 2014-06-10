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
  
  it "requires a user" do
    article = FactoryGirl.build :article, user: nil
    article.should_not be_valid
    article.errors[:user].should include "can't be blank"
  end

  it "can add a section" do
    article = FactoryGirl.create :article
    section = FactoryGirl.create :section, article: article
  	article.sections.should include section
  end
end
