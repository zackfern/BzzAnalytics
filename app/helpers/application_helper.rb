module ApplicationHelper
  # Public: Sets the yield(:title) block, for use in application.html.erb
  #   page_title - String for the page title
  #
  # Returns an HTML-safe string.
  def title(page_title)
    content_for(:title) { h(page_title.to_s) }
    content_tag :h1, page_title
  end

  # Public: Returns the current user, if someone's logged in.
  #
  # Returns a User
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  # Public: Check if there's currently a user session.
  #
  # Returns boolean.
  def user_signed_in?
    session[:user_id].present?
  end
end
