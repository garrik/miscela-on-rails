require 'spec_helper'

describe "Articles" do
  before do
    @article = Article.create :author => "erik", :title => "Primo post"
  end

  describe "GET /articles" do
    it "displays an article" do
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
      fill_in "article[title]", :with => 'Secondo post'
      fill_in "article[content]", :with => 'bla bla bla'
      click_button "Create Article"
      
      current_path.should == articles_path
      page.should have_content 'Secondo post'
      page.should have_content 'bla bla bla'
    end
  end
  
  describe "PUT /articles" do
    it "edits an article" do
      visit articles_path
      page.has_selector?('.article:nth-child(2) a')
      page.has_css?('.article')
      page.should have_selector('.article')
      page.should have_css('.article')
      page.should have_link 'Edit'

      within(".article:nth-child(2) a") do
        print page.html
        page.should have_link 'Edit'
        click_link 'Edit'
      end
      
      current_path.should == edit_articles_path(@article)
      page.should have_content 'Secondo post'
      #find_field('Article').value.should == 'Secondo post'

      fill_in "article[title]", :with => 'Post modificato'
      click_button "Update Article"

      current_path.should == articles_path
      page.should have_content 'Post modificato'
    end
  end
end
