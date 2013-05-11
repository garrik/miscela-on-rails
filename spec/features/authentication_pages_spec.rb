require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_content "Area di amministrazione" }

    describe "with invalid information" do
      before { click_button "Accedi" }

      it { should have_selector('.error', text: 'Invalid') }
  
      describe "after visiting another page" do
        before { click_link "Logo Miscela" }
  
        it { should_not have_selector('.error') }
      end
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }

      before do
        fill_in "Username", with: user.userid.upcase
        fill_in "Password", with: user.password
        click_button "Accedi"
      end
  
      it { has_title? "Pubblicazione articolo" }
      it { should have_link('Log out', href: signout_path) }
      it { should have_link('Area riservata', href: new_article_path) }
      it { should_not have_link('Area riservata', href: signin_path) }      
    end
  
  end
end