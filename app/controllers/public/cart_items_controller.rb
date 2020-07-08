class Public::CartItemsController < ApplicationController





	def index
		@cart_items = current_customer.cart_items
		@total_price = calculate(current_customer)
	end

	def create
		@cart_item = CartItem.new(cart_item_params)
		@cart_item.customer_id = current_customer.id
		@cart_item.save
		redirect_to public_cart_items_path
	end

	def update
		@cart_item = CartItem.find(params[:id])
		@cart_item.update(cart_item_params)
		redirect_to request.referer
	end

	def destroy
		cart_item = CartItem.find(params[:id])
#		@cart_item = Cart_item.find(item_id: params[:item_id])
		cart_item.destroy
		redirect_to request.referer
	end

	def destroy_all
		current_customer.cart_items.destroy_all
		redirect_to request.referer
	end




	private

	def cart_item_params
		params.require(:cart_item).permit(:item_id, :amount, :customer_id)
    end


	def calculate(customer)
		total_price = 0
		customer.cart_items.each do |cart_item|
			total_price += cart_item.amount * cart_item.item.price.to_i
		end
		return (total_price * 1.1).floor
    end
end
