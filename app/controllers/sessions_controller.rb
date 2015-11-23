class SessionsController < ApplicationController

  def new
    
  end

  def create
    @user = User.find_by(username: params[:username])
      if @user && @user.password == params[:password]
        session[:user_id] = @user.id
        puts "**session created**"
        flash[:notice] = "Success."
        redirect_to @user
      else
        flash[:alert] = "Wrong credentials. Please try again"
        puts "**oh fuck**"
        render :new
      end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Signed out."
    redirect_to root_path
    puts "**session terminated**"
  end

end