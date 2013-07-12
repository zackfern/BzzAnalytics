class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.login_from_google(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to :root, notice: "Welcome, #{user.email}."
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root, notice: 'Goodbye.'
  end

  def kill
    reset_session
    redirect_to :root
  end
end
