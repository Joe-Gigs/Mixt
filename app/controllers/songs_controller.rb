class SongsController < ApplicationController
	before_action :set_song, only: [:show, :edit, :update, :destroy]

	def index
		@tape = current_tape
		@songs = Song.all

	end

	def new 
		@tape = current_tape
		@song.Song.new
	end

	def create
		@song = Song.create(song_params)
		@song.tape_id = params[:tape_id]
		if @song.save
			redirect_to user_tape_song_path(@song.tape_id, @song.id)
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
		params.require(:songs).permit(:song).merge(tape: current_tape)
	end

	def set_song
		@song = Song.find(params[:id])
	end
end
end