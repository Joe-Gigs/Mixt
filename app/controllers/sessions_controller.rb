class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(username: params[:username])
      if @user && @user.password == params[:password]
        session[:user_id] = @user.id
        flash[:notice] = "Success."
        redirect_to @user
      else
        flash[:alert] = "Wrong credentials. Please try again"
        render :new
      end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Signed out."
    redirect_to root_path
  end

end