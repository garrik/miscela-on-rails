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
    @subscr = Subscription.find params[:id]
    if @subscr.update_attributes params[:subscription]
      if @subscr.errors.any?
        @errors= @subscr.errors
      end
      redirect_to edit_subscription_path(@subscr.id), :notice => 'Iscrizione aggiornata'
    else
      redirect_to :back, :alert => 'Errore'
    end
  end

  def delete
  end

  def destroy
    Subscription.destroy params[:id]
    redirect_to :back, :notice => 'Iscrizione cancellata'
  end

end
