module SubscriptionsHelper
  def smart_add_url_protocol(url)
    url = 'http://' + url unless url[/^http:\/\//] || url[/^https:\/\//]
    url
  end

  # janrain auth
  def janrain_sign_out
    session[:janrain_userid] = nil
    session[:janrain_email] = nil
    session[:janrain_name] = nil
    #self.janrain_user = nil
    #cookies.delete(:janrain_remember_token)
  end
  def janrain_signed_in?
    !session[:janrain_userid].nil?
  end
  
  private
  def authenticated_user
    redirect_to openid_signin_path, notice: 'Perfavore autenticati' unless user_authenticated?
  end
  def user_authenticated?
    janrain_signed_in? || signed_in?
  end

  def janrain_signed_in_user
    redirect_to openid_signin_path, notice: 'Perfavore autenticati' unless janrain_signed_in?
  end

  def janrain_sign_in(authentication)
    session[:janrain_userid] = authentication["profile"]["identifier"]
    session[:janrain_email] = authentication["profile"]["email"]
    session[:janrain_name] = authentication["profile"]["name"]["formatted"]
    #cookies.permanent[:janrain_remember_token] = token
    #user = Users.new
    #self.janrain_user = user
  end

  def janrain_user=(user)
    @janrain_user = user
  end

  def janrain_user
    @janrain_user #||= User.find_by_remember_token(cookies[:janrain_remember_token])
  end

  def janrain_user_is_owner
    #janrain_signed_in_user
    subscr = Subscription.find params[:id]
    redirect_to new_subscription_path, notice: 'Puoi accedere solo alle tue iscrizioni' unless subscr.userid == session[:janrain_userid]
  end

end