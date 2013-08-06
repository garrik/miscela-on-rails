class SubscriptionsController < ApplicationController
  #before_filter :user_is_owner, only: [ :create, :new, :edit, :update, :destroy ]

  @current_event = 'mrf12'

  def new
    @subscr = Subscription.new
    @subscrs = Subscription.find(:all, :order => "id desc")
  end

  def index
    @subscr = Subscription.new
    @subscrs = Subscription.find(:all, :order => "id desc")
  end

  def show
    @subscr = Subscription.find params[:id]
  end

  def edit
    @subscr = Subscription.find params[:id]
    @subscrs = Subscription.find(:all, :order => "id desc")
  end

  def create
    @subscrs = Subscription.find(:all, :order => "id desc")

    @subscr = Subscription.new(params[:subscription])
    @subscr.event = '@current_event'
    @subscr.name = 'pippo'
    @subscr.userid = 'medesimo'
    @subscr.email = 'aaa@bbb.it'
    @subscr.save

    if @subscr.persisted?
      redirect_to edit_subscription_path(@subscr.id), :notice => 'Ti sei iscritto al Miscela Rock Festival'
    else
      render 'edit'
    end
  end

  def update
  end

  def delete
  end

end
