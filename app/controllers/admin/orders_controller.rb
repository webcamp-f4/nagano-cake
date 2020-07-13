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
	def update
	    @order = Order.find(params[:id])
        if @order.update(order_params)
           redirect_to admin_order_path(@order)
        else
        render "show"
        end
	end
end
