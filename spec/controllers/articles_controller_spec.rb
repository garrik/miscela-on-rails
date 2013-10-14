require 'spec_helper'

describe ArticlesController do
  describe "articles list" do
    it "allows clients to get articles list" do
      get 'index'
      expect(response.status).to eq(200)
    end
  end

  describe "articles headlines" do
    it "allows index page to get articles headlines" do
      request.env["HTTP_ACCEPT"] = 'application/json'
      get 'headlines'
      expect(response.status).to eq(200)
    end
  end

  describe "articles rss" do
    it "allows client to get rss feeds" do
      get 'rss_feeds', :format => :xml
      expect(response.status).to eq(200)
    end
  end

  describe "show article" do
    let(:article) { FactoryGirl.create(:article) }
    it "allows client to get an article" do
      #get 'article', { id: 1 }
      #article = FactoryGirl.create(:article)
      get 'show', id: article.id
      expect(response.status).to eq(200)
    end
  end
end
