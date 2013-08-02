require 'spec_helper'

describe StaticPagesController do

  describe "GET 'miscela'" do
    it "returns http success" do
      get 'miscela'
      response.should be_success
    end
  end

  describe "GET 'partners'" do
    it "returns http success" do
      get 'partners'
      response.should be_success
    end
  end

  describe "GET 'credits'" do
    it "returns http success" do
      get 'credits'
      response.should be_success
    end
  end

  describe "GET 'contacts'" do
    it "returns http success" do
      get 'contacts'
      response.should be_success
    end
  end

end
