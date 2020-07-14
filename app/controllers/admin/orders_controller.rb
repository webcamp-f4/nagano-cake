class Admin::OrdersController < ApplicationController
	def today
		@orders = Order.where(created_at:  Time.zone.now.all_day)
    end

	def index
		@orders = Order.page(params[:page]).reverse_order
	end

	def show
	    @order = Order.find(params[:id])
	    @order_items = @order.order_items
	end

	def status_update
		order = Order.find(params[:id])
	    order.update(order_params)
	    # OrderDetailModel after_update => 注文ステータスの自動更新
	    redirect_to admin_order_path(order)
	end

	def making_status_update
	    order_item = OrderItem.find(params[:id])
		order_item.update(order_item_params)
		# OrderModel after_update => 製作ステータスの自動変更
		redirect_to admin_order_path(order_item.order_id)
  	end

	private
	def order_params
		params.require(:order).permit(:status)
	end

	def order_item_params
		params.require(:order_item).permit(:making_status)
	end
end
