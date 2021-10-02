class SessionsController < ApplicationController

  def login
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to service_path
    else
      render 'sessions/login'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to login_path
  end
end
