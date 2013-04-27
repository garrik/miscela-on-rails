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

end
