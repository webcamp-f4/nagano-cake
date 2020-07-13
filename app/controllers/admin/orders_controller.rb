class Admin::OrdersController < ApplicationController
	def today
		@orders = Order.where(created_at: Time.zone.now.all_day)
    end
	def index
		@orders = Order.page(params[:page]).reverse_order
	end
	def show
	    @order = Order.find(params[:id])
	    @order_item = Order_item.all
	end
	def update
	    @order = Order.find(params[:id])
        if @order.update(order_params)
           redirect_to @order
        else
        render "show"
        end
	end
end
