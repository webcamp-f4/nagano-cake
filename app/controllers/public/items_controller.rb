class Public::ItemsController < ApplicationController
	PER = 8

	def index
		@items = Item.page(params[:page]).per(PER)
	end

	def show
		@item = Item.find(params[:id])
	end
end
