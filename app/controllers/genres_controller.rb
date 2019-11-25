class GenresController < ApplicationController
	before_action :find_genre, only: [:show, :edit, :update, :destroy]

	def index
		@genres = Genre.all
	end

	def new
		@genre = Genre.new
	end

	def create
		genre = Genre.create(genre_strong_params)
		redirect_to genre_path(genre)
	end

	def update
		@genre.update(genre_strong_params)
		redirect_to genre_path(@genre)
	end

	def destroy
		@genre.destroy
		redirect_to genres_path
	end

	private

		def find_genre
			@genre = Genre.find(params[:id])
		end

		def genre_strong_params
			params.require(:genre).permit(:name)
		end
end
