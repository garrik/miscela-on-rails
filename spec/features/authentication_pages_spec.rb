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
      it { has_button? "Esci" }
      it { should have_link('Area riservata', href: new_article_path) }
      it { should_not have_link('Area riservata', href: signin_path) }

      describe "followed by signout" do
        before { click_button "Esci" }
        it { should have_link "Area riservata" }
      end

    end
  
  end
  
  describe "authorization" do

    describe "for non-signed-in users" do
      let(:user) { FactoryGirl.create(:user) }

      describe "in the Articles controller" do

        describe "visiting the create article page" do
          before { visit new_article_path(user) }
          it { has_title? "Entra nell'area di amministrazione" }
        end

        # see http://www.andylindeman.com/2012/11/11/rspec-rails-and-capybara-2.0-what-you-need-to-know.html
        # must be moved to spec/requests
        #describe "submitting to the update action" do
          #let(:article) { FactoryGirl.create(:article) }

          #before { put article_path(article) }
          #specify { response.should redirect_to(signin_path) }
        #end
      end
    end
  end
end