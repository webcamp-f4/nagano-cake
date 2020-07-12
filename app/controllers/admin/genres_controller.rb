class Admin::GenresController < ApplicationController
	
	def index
		@genre = Genre.new
		@genres = Genre.all
	end
  
	def edit
		@genre = Genre.find(params[:id])
	end

	def create
		@genre = Genre.new(genre_params)
		@genres = Genre.all
		if @genre.save
		   redirect_back(fallback_location: root_path)
		else
		   render :index
		end
	end
  
	def update
		@genre = Genre.find(params[:id])
		if @genre.update(genre_params)
		   redirect_to admin_genres_path
		else
		   redirect_back(fallback_location: root_path)
		end
	end

	private
    def genre_params
    	params.require(:genre).permit(:name, :valid_status)
    end
end
