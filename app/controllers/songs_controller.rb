class SongsController < ApplicationController
	before_action :set_song, only: [:show, :edit, :update, :destroy]

	def index
		@songs = Song.all
	end

	def new 
		@song = Song.new
	end

	def create
		@song = Song.create(song_params)
		redirect_to tape_path(params[:tape_id])
		if @song.save 
			flash[:heya] = "Song added"
		else
			flash[:notworking] = "Song not added"
		end
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

	def song_params
		params.require(:song).permit(:song)
	end

	def set_song
		@song = Song.find(params[:id])
	end
end
