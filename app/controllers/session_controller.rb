class SessionController < ApplicationController

  before_action :check_if_logged_out, :only => [:new]

  def new
  end

  def create
    user = User.find_by :email => params[:email]
    #is there such user and does the password match
    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:error] = "Invalid email or password" unless !params[:email]
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:logout] = "Logged out successfully"
    redirect_to root_path
  end
end
