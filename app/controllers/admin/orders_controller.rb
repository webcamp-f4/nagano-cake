class Admin::OrdersController < ApplicationController
	def today	
		@order = Order.all
		   @order.each do |order|
		   	if (order[created_at].to_s.match(/#{Date.today.to_s}.+/))
		   		@date += order[:id]
		   	end
		   end
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
