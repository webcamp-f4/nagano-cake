class Public::CartItemsController < ApplicationController

	before_action :setup_cart_item!, only: [:update, :destroy]

	def index
		@cart_items = current_customer.cart_items
	end

	def update
		@cart_item.update(amount: params[:amount].to_i)
		redirect_to request.referer
	end

	def destroy
		@cart_item.destroy
		redirect_to request.referer
	end

	def destroy_all
		
	end

	private
	def setup_cart_item!
		@cart_item = current_customer.cart_items.find_by(item_id: params[:item_id])
	end
end
