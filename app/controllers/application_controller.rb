class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception

  helper_method :current_user
  
  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by_session_token(session[:session_token])
  end
  
  
  def logout!
    current_user.try(:reset_session_token!)
    session[:session_token] = nil
  end
  
  def login_user! user
    session[:session_token] = user.reset_session_token!
  end
  
  def require_current_user
    redirect_to new_session_url unless current_user
  end
  
  def require_no_current_user
    redirect_to bands_url if current_user
  end
end
