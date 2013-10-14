require 'spec_helper'

describe "Openid" do

  subject { page }

  describe "signin page" do
    before { visit openid_signin_path }

    it { should have_content "Accedi per iscriverti" }
  end
end