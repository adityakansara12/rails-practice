class SessionsController < ApplicationController
  def login
    @user = User.new
    redirect_to cars_path if logged_in?
  end

  def create
    @user = User.find_by(username: params[:username])

    if !!@user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:info] = 'Successfully logged in'
      cookies[:username] = @user.username
      redirect_to cars_path
    else
      redirect_to login_path
    end
  end

  def logout
    session.delete(:user_id) unless session[:user_id].nil?
    flash[:info] = 'Successfully logged out'
    redirect_to login_path
  end
end
