class SongsController < ApplicationController
	def index
		@songs = Song.all
	end

	def new 
		@song = Song.new
	end

	def create
		@tape = Tape.find(params[:tape_id])
		@song = @tape.songs.create(song_params)
		@song.user_id = current_user.id 
		
		if @song.save 
			flash[:heya] = "Song added"
		else
			flash[:notworking] = "Song not added"
		end
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

	def song_params
		params.require(:song).permit(:song)
	end

	def set_song
		@song = Song.find(params[:id])
	end
end
