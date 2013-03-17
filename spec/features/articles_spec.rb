require 'spec_helper'

describe "Articles" do
  before do
    @article = Article.create :author => "erik", :title => "Primo post", :content => "bla bla bla", :draft => false
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
  end
    
  describe "GET /articles/new" do
    it "displays article creation form" do
      visit new_article_path
      fill_in "article[title]", :with => 'Secondo post'
      fill_in "article[content]", :with => 'bla bla bla'
      find_button "Invia"
    end
  end

  describe "POST /articles" do
    it "creates an article" do
      visit new_article_path
      fill_in "article[title]", :with => 'Secondo post'
      fill_in "article[content]", :with => 'bla bla bla'
      click_button "Invia"
      
      @new_article = Article.first(:order => 'created_at DESC')
      current_path.should == preview_article_path(@new_article)
      page.should have_content 'Bozza'
      page.should have_content 'Secondo post'
      page.should have_content 'bla bla bla'

      find('#message').should have_content 'Articolo creato'

      @new_article.draft.should == true
      click_button "Pubblica"

      current_path.should == article_path(@new_article)
      #page.should have_no_content 'Bozza'
      page.should have_content 'Secondo post'
      page.should have_content 'bla bla bla'
      find('#message').should have_content 'Articolo pubblicato'

      #Rails.logger.debug '@new_article.draft = ' + @new_article.draft.to_s
      #@new_article.draft.should == false
    end
  end

  describe "PUT /articles" do
    it "edits an article" do
      Rails.logger.debug '@article.inspect = ' + @article.inspect
      visit articles_path
      find("#article_#{@article.id} a").should have_content 'Modifica'
      find("#article_#{@article.id}").click_link 'Modifica'

      current_path.should == edit_article_path(@article)
      fill_in "article[title]", :with => 'Primo post modificato'
      fill_in "article[content]", :with => 'bla bla bla modificato'
      click_button "Invia"
      
      current_path.should == preview_article_path(@article)
      page.should have_content 'Primo post modificato'
      page.should have_content 'bla bla bla modificato'

      find('#message').should have_content 'Articolo modificato'

      @article.draft.should == true
      click_button "Pubblica"

      current_path.should == article_path(@article)
      page.should have_content 'Primo post modificato'
      page.should have_content 'bla bla bla modificato'
      find('#message').should have_content 'Articolo pubblicato'

      @article.draft.should == false
    end
    it "should not create article with empty title" do
      visit new_article_path
      fill_in "article[title]", :with => ''
      click_button "Invia"
      current_path.should == new_article_path
      page.should have_content 'Error'
    end
    it "should not create article with empty content" do
      visit new_article_path
      fill_in "article[content]", :with => ''
      click_button "Invia"
      current_path.should == new_article_path
      page.should have_content 'Error'
    end
    it "should not update article with empty title" do
      visit edit_article_path(@article)
      fill_in "article[title]", :with => ''
      click_button "Invia"
      current_path.should == edit_article_path(@article)
      page.should have_content 'Error'
    end
  end
  
  describe "DELETE /articles" do
    it "deletes an article" do
      visit articles_path
      #find ("#article_#{@article.id} input").click 'Delete'
      all('.article').first.find_button('Cancella').click
      current_path.should == articles_path
      #save_and_open_page
      page.should have_content 'Articolo cancellato'
      #page.should_not have_content 'bla bla bla'

    end
  end
end
