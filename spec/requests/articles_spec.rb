require 'spec_helper'

describe "Articles" do
  describe "GET /articles" do
    it "displays some articles" do
      visit articles_path
      page.should have_content 'News'
    end
  end
end
