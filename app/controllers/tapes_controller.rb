class TapesController < ApplicationController
	before_action :set_tape, only: [:show, :edit, :update, :destroy]
	def index
		@user = current_user
		@tapes = Tape.all
	end

	def new
		@user = current_user
		@tape = Tape.new
	end

	def create
		@tape = Tape.create(tape_params)
		@tape.user_id = params[:user_id]
		if @tape.save
			redirect_to user_tapes_path(params[:user_id], @tape.id)
		end
	end
	
	def show

	end

	def edit
	end

	def update
		if @tape.update(tape_params)
			@tape.user_id = params[:user_id]
			redirect_to [@tape.user, @tape]
			
		end
	end

	def destroy
		@tape.destroy
		redirect_to user_tape_path
	end

	private

	def tape_params
		params.require(:tape).permit(:tapename, :description, :user_id, :song).merge(user: current_user)
	end
	
	def set_tape
		@tape = Tape.find(params[:id])
	end
end

