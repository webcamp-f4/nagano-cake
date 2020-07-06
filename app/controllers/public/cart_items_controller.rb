class Public::CartItemsController < ApplicationController

	def index
		@customer = current_customer
		@cart_items = @customer.cart_items
	end

	def update
		redirect_to request.referer
	end

	def destroy
		@cart_item = current_customer.cart_items.find_by(item_id: params[:item_id])
		@cart_item.destroy
		redirect_to request.referer
	end

	def destroy_all
		@customer = current_customer
		@cart_items = @customer.cart_items
		@cart_items.destroy_all
		redirect_to request.referer
	end
end
