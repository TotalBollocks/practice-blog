require 'spec_helper'

describe "authors" do
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
  
  specify "can't edit another's article" do
    FactoryGirl.create :article, user: FactoryGirl.create(:user), subject: subject
    click_link subject.name
    page.should_not have_css "a", text: "Edit"
  end
end