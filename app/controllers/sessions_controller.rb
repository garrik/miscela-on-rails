class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_userid(params[:session][:userid].downcase)
    if user && user.authenticate(params[:session][:password])
      # Sign the user in and redirect to the user's show page.
      sign_in user
      redirect_to new_article_path
    else
      # Create an error message and re-render the signin form.
      flash[:alert] = 'Invalid login'
      redirect_to new_session_path
    end

  end

  def destroy
  end
end
