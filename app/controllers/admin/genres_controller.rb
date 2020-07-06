class Admin::GenresController < ApplicationController
	def create
		genre = Genre.new(genre_params)
		if genre.save
		   redirect_back(fallback_location: root_path)
		else
		   render "index"
		end
	end


	def index
		@genre = Genre.new
		@genres = Genre.all
	end
	def edit
		@genre = Genre.find(params[:id])
	end

	private
    def genre_params
    params.require(:genre).permit(:name, :valid_status)
    end
end
