class SongsController < ApplicationController
    before_action :find_song, only: [:show, :edit, :update, :destroy]

	def index
		@songs = Song.all
	end

	def new
		@song = Song.new
    end
    
    def create
        artist = Artist.find_or_create_by(name: song_params[:artist_name])
        genre = Genre.find_or_create_by(name: song_params[:genre_name])
        @song = artist.songs.build(song_params)
        @song = genre.songs.build(song_params)
        @song.save!
        # byebug
        redirect_to song_path(@song)
    end
    
    # artist = Artist.find_or_create_by(name: song_params[:artist_name])
    # @song = artist.songs.build(song_params)

    # if @song.save
    #   redirect_to songs_path
    # else
    #   render :new
    # end

	def update
		@song.update(song_params)
		redirect_to song_path(@song)
	end

	def destroy
		@song.destroy
		redirect_to songs_path
	end

	private

		def find_song
			@song = Song.find(params[:id])
		end

        def song_params
            params.require(:song).permit(:name, :artist_name, :genre_name)
        end
end