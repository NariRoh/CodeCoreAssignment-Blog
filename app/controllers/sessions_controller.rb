class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email params[:email]
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      if session[:redirect_url].present?
        redirect_to session[:redirect_url], notice: 'Signed in!'
      else
        redirect_to root_path, notice: 'Signed in!'
      end

      # redirect_to session[:redirect_url] || root_path, notice: 'Signed in!'
      # session[:redirect_url] = nil
    else
      flash.now[:alert] = 'Wrong credentials'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    session[:redirect_url] = nil
    redirect_to root_path, notice: 'Signed out!'
  end

end
