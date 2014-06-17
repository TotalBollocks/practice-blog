require 'spec_helper'

describe "authors", focus: true do
  let(:author) { FactoryGirl.create :user }
  let(:user) { FactoryGirl.create :user }
  let(:role) { FactoryGirl.create :role, name: "Author" }
  let!(:subject) { FactoryGirl.create :subject }
  
  before do
    author.roles << role
    sign_in author
  end
  
  specify "can make new article" do
    click_link "Write Article"
    fill_in "Title", with: "My Article"
    fill_in "Summary", with: "Bla bla bla.."
    select subject.name, from: "article_subject_id"
    click_button "Create Article"
    page.should have_content "My Article"
  end
  
  specify "can edit their own articles" do
    article = FactoryGirl.create :article, user: author, title: "Mine", subject: subject
    click_link subject.name
    within("##{article.title.parameterize}") do
      click_link "Edit"
    end
    fill_in 'Title', with: "Changed"
    click_button "Update Article"
    page.should have_content "Changed"
  end
end