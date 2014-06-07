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

  it "can add a section", focus: true do
    subject = Subject.create! name: "Test Subject"
  	article = Article.create! title: "TEST!", subject: subject
  	section = Section.create! content: "test", article: article
  	article.sections.should include section
  end
end
