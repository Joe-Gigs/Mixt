class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		if @user.save
		session[:user_id] = @user.id #VERY IMPORTANT, LIKE SERIOUSLY

	

		redirect_to @user
	else
		render :new
	end
end

	def edit

	end

	def update
		if @user.update(user_params)
			redirect_to @user
		else
			render :new
	end
end

	def index
		@users = User.all
	end

	def show

		
	end

	def destroy
		@user.destroy
		redirect_to log_in_path

	end
	

	private

	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:fname, :lname, :username, :password, :password_confirmation, :avatar)
	end
end

