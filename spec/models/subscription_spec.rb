require 'spec_helper'

describe Subscription do
  before do 
    @subscription = FactoryGirl.create(:subscription)
  end

  subject { @subscription }  

  it { should respond_to(:name) }
  it { should respond_to(:event) }
  it { should respond_to(:email) }
  it { should respond_to(:userid) }
  it { should respond_to(:band_name) }
  it { should respond_to(:band_members_number) }
  it { should respond_to(:genre) }
  it { should respond_to(:city) }
  it { should respond_to(:notes) }
  it { should respond_to(:website) }
  it { should respond_to(:website2) }
  it { should respond_to(:video_link) }

  describe "when event is not present" do
    before { @subscription.event = " " }
    it { should_not be_valid }
  end

  describe "when userid is not present" do
    before { @subscription.userid = " " }
    it { should_not be_valid }
  end

  #describe "when subscription is already taken" do
  #  before do
  #    subscription_with_same_userid_and_event_id = @subscription.dup
  #    subscription_with_same_userid_and_event_id.save
  #  end
  #  it { should_not be_valid }
  #end

end
