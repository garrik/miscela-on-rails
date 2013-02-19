require 'spec_helper'

describe "Articles" do
  describe "GET /articles" do
    it "displays an article" do
      article = Article.create :author => "erik", :title => "Primo post"
      visit articles_path
      page.should have_content 'News'
      page.should have_content 'Primo post'
      #assert_select "article" do
        #assert_select "h3", "primo post"
        #assert_select ".meta", "erik"
        #meta = css_select(".meta")
        #meta.include? "erik"
      #end
    end
    
    it "creates an article" do
      visit articles_path
      fill_in "article[title]", :with => "Secondo post"
      fill_in "article[content]", :with => "bla bla bla"
      click_button "Create Article"
      
      current_path.should == articles_path
      page.should have_content 'Secondo post'
      page.should have_content 'bla bla bla'
      
    end
  end
end
