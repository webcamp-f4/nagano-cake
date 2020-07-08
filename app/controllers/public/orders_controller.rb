class Public::OrdersController < ApplicationController


	def new
		@order = Order.new
	end

	def create
		@order = Order.new(order_params)
		@order.customer_id = current_customer.id
		redirect_to public_orders_confirm_path
	end

	def thanks
	end

	def confirm
		@order = Order.new
		@cart_items = current_customer.cart_items
		@items = @cart_items.items
	end

	private
	def order_params
		params.require(:order).permit(:pay_method, :total_due,
		 :postage, :status,
		  :shipping_name, :shipping_postal_code,
		   :shipping_address)
	end
end
