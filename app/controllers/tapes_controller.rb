class TapesController < ApplicationController
	before_action :set_tape, only: [:show, :edit, :update, :destroy]
	def index
		@user = current_user
		@tapes = Tape.all

	end

	def new
		@tape = Tape.new
	end

	def create
		@tape = Tape.new(tape_params)
		# @tape.user_id = params(:user_id)
		@tape.save
			redirect_to @tape
end
	def show

	end

	def edit
	end

	def update
	end

	def destroy
	end

private

def tape_params
	params.require(:tape).permit(:tapename, :description, :user_id, :song)
	end

	def set_tape
    @tape = Tape.find(params[:id])
  end

	
	
end

