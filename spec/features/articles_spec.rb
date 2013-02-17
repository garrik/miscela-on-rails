require 'spec_helper'

describe "Articles" do
  describe "GET /articles" do
    it "displays an article" do
      article = Article.create :author => "erik", :title => "Primo post"
      visit articles_path
      page.should have_content 'News'
      page.should have_content 'Primo post'
    end
  end
end
