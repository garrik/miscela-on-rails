require 'spec_helper'

describe SubscriptionsController do
  describe "GET 'openid_signin'" do
    it "returns http success" do
      get 'janrain_session_new'
      response.should be_success
    end
  end
end
