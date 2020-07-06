class Public::CartItemsController < ApplicationController

	def index
		@cart_items = CartItem.all
		@cart_item = CartItem.new
	end

	def create
		@cart_item = current_customer.cart_items.build(cart_item_params)
		@cart_items = current_customer.cart_items.all
		@cart_items.each do |cart_item|
			if cart_item.item_id == @cart_item.item_id
				new_amount = cart_item.amount + @cart_item.amount
				cart_item.update_attribute(:amount, new_amount)
				@cart_item.delete
			end
		end
		@cart_item.save
		redirect_to request.referer
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
