require 'spec_helper'

describe Subject do

  it "requires name", focus: true do
  	subject = FactoryGirl.build :subject, name: ""
  	subject.should_not be_valid
  	subject.errors[:name].should include "can't be blank"
  end

  it "has unique name", focus: true do
  	existing = FactoryGirl.create :subject
  	subject = FactoryGirl.build :subject, name: existing.name
  	subject.should_not be_valid
  	subject.errors[:name].should include "has already been taken"
  end

  it "can add an article", focus: true do
  	subject = FactoryGirl.create :subject
  	article = FactoryGirl.build :article
  	subject.articles << article
  	subject.articles.should include article
  end

end
