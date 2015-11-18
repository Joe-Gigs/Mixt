class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_username(params[:username])
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Success."
    else
      flash[:alert] = "There was a problem"
    end
      redirect_to @user
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Signed out."
    redirect_to root_path
  end

end