require 'spec_helper'

describe "viewing articles" do
  
  let!(:article) {FactoryGirl.create :article}
  let!(:section) {FactoryGirl.create :section, article: article}
  
  it "can view an article anonymously" do
    visit root_path
    click_link article.subject.name
    click_link article.title
    page.should have_content section.content
  end
end