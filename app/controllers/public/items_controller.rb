class Public::ItemsController < ApplicationController
	def index
		@items =Items.all
	end

	def show
		@item = Item.find(params[:id])
	end
end
