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
		@order = Order.find_by(customer_id: params[:current_customer.id])
	end

	private
	def order_params
		params.require(:order).permit(:pay_method, :total_due, :postage, :status, :shipping_name, :shipping_postal_code, :shipping_address)
	end
end
