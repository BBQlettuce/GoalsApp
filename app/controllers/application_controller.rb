class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user

  def login!(user)
      session[:session_token] = user.session_token
  end

  def logged_in?
    !!current_user
  end

  def logout!
    current_user.reset_session_token!
    session[:session_token]= nil
  end

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by(:session_token => session[:session_token])
  end

  def require_login
    redirect_to new_session_url if !logged_in?
  end
end
