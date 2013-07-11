class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.login_from_google(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to :root, notice: "Welcome, #{user.email}."
  end

  def destroy
  end
end
