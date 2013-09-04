class SubscriptionsController < ApplicationController
  include SubscriptionsHelper
  include ArticlesHelper
  include SessionsHelper
  before_filter :authenticated_user, only: [ :download_song1, :download_song2, :download_photo, :download_attachment ]
  before_filter :signed_in_user, only: [ :index ]
  before_filter :janrain_signed_in_user, only: [ :create, :new ]
  before_filter :janrain_user_is_owner, only: [ :edit, :update, :delete, :destroy ]

  @current_event = 'mrf12'

  # crud
  def new
    @subscr = Subscription.new
    @subscr.band_members.push BandMember.new
    @subscr.band_members.push BandMember.new
    @subscrs = Subscription.find(:all, conditions: ["userid = ?", session[:janrain_userid]], :order => "id desc")
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
    @subscrs = Subscription.find(:all, conditions: ["userid = ?", session[:janrain_userid]], :order => "id desc")
  end

  def create
    @subscrs = Subscription.find(:all, :order => "id desc")

    @subscr = Subscription.new(params[:subscription])
    @subscr.event = '@current_event'
    @subscr.name = session[:janrain_name]
    @subscr.userid = session[:janrain_userid]
    @subscr.email = session[:janrain_email]
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
    redirect_to new_subscription_path, :notice => 'Iscrizione cancellata'
  end

  def janrain_session_new
  end

  def janrain_session_create

    logger.debug "janrain_signed_in? #{janrain_signed_in?}"
    if janrain_signed_in?
      redirect_to new_subscription_path, notice: "Utente gia' autenticato"
    else
      #render text: "HTTParty started"
      logger.debug "HTTParty started"
      # Thanks to http://blog.teamtreehouse.com/its-time-to-httparty
      authentication = HTTParty.post(Rails.configuration.janrain_auth_url,
        :query => { apiKey: Rails.configuration.janrain_api_key, 
          responseDataFormat: "json", 
          destinationUrl: new_subscription_path,
          token: params[:token] })
      if authentication["stat"] == "ok"
        logger.debug "auth ok"
        janrain_sign_in authentication
      else
        logger.debug "auth ko"
        redirect_to openid_signin_path, notice: "Errore di autenticazione dell'utente. Riprova, se l'errore persiste provare con un account differente."
      end
      redirect_to new_subscription_path
    end
  end

  def janrain_session_destroy
    janrain_sign_out
    redirect_to root_path
  end

  # files download
  def download_song1
    @subscr = Subscription.find params[:id]
    download_file(@subscr.song1, nil)
  end
  def download_song2
    @subscr = Subscription.find params[:id]
    download_file(@subscr.song2, nil)
  end
  def download_photo
    @subscr = Subscription.find params[:id]
    download_file(@subscr.photo, nil)
  end
  def download_attachment
    @subscr = Subscription.find params[:id]
    download_file(@subscr.attachment, nil)
  end

end
