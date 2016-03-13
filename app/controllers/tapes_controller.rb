class TapesController < ApplicationController
  before_action :set_tape, only: [:show, :edit, :update, :destroy]

  def index
    @tapes = Tape.all
  end

  def new
    @tape = Tape.new
    @song = Song.new
  end

  def create
    @tape = Tape.create(tape_params)
    @tape.user_id = session[:user_id]
    if @tape.save
      redirect_to tape_path(@tape.id)
    else
      redirect_to new_tape_path(current_user)
      flash[:notape] = "Please keep your tape name and description short. And remember to add an image"
    end
  end

  def show
    @tapes = Tape.all
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
    redirect_to user_path(current_user)
  end

  private

  def tape_params
    params.require(:tape).permit(:tapename, :description, :user_id, :tapepic).merge(user: current_user)
  end

  def song_params
    params.require(:song).permit(:songs)
  end

  def set_tape
    @tape = Tape.find(params[:id])
    @songs = @tape.songs
  end
end

