class ArtistsController < ApplicationController
	before_action :find_artist, only: [:show, :edit, :update, :destroy]

	def index
		@artists = Artist.all
	end

	def new
		@artist = Artist.new
	end

	def create
		artist = Artist.create(artist_strong_params)
		redirect_to artist_path(artist)
	end

	def update
		@artist.update(artist_strong_params)
		redirect_to artist_path(@artist)
	end

	def destroy
		@artist.destroy
		redirect_to artists_path
	end

	private

		def find_artist
			@artist = Artist.find(params[:id])
		end

		def artist_strong_params
			params.require(:artist).permit(:name,
				song_attributes: [:name, :artist_id, :genre_id])
		end
end
