require 'spec_helper'

describe User do
  before do 
  	@user = User.new(:name => "John", :surname => "Doe", :email => "j.doe@example.com", :userid => "johndoe", :password => "password", :password_confirmation => "password")
  end

  subject { @user }  

  it { should respond_to(:name) }
  it { should respond_to(:surname) }
  it { should respond_to(:email) }
  it { should respond_to(:userid) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }

  describe "when userid is already taken" do
  	before do
  	  user_with_same_userid = @user.dup
  	  user_with_same_userid.save
  	end
  	it { should_not be_valid }
  end

  describe "when password is not present" do
  	before { @user.password = @user.password_confirmation = " " }
  	it { should_not be_valid }
  end

  describe "when passwords doesn't match" do
  	before { @user.password_confirmation = "mismatch" }
  	it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
  	before { @user.password_confirmation = nil }
  	it { should_not be_valid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by_userid(@user.userid) }

    describe "with valid password" do
      it { should == found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
    end
  end

  describe "remember token" do
    before { @user.save }
    #it { @user.remember_token.should_not be_blank }
    its(:remember_token) { should_not be_blank }

  end
end
