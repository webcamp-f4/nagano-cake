class Admin::GenresController < ApplicationController
	def index
		@genre = Genre.new
		@genres = Genre.all
	end
	def edit
		@genre = Genre.find(params[:id])
	end
	def create
		@genre = Genre.new
		@genres = Genre.all
		if @genre.save
		   redirect_back(fallback_location: root_path)
		else
		   render :index
		end
	end
end
