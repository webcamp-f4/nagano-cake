class Admin::ItemsController < ApplicationController
	def index
		@items = Item.all
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(item_params)
		@items = Item.all
        if @item.save 
          rendeirect_to @item
        else
        redirect_back(fallback_location: admin_items_path)
        end
	end

	def show
		@item = Item.find(params[:id])
	end

	def edit
		@item = Item.find(params[:id])
	end

	private
    def item_params
    params.require(:item).permit(:name, :price, :image, :introduction, :sales_status)
    end
end
