class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  # Public: Returns the current user, if someone's logged in.
  #
  # Returns a User
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  # Public: Redirects user to login page if they aren't logged in.
  #
  def authenticate_user!
    redirect_to :login unless session[:user_id]
  end
end
