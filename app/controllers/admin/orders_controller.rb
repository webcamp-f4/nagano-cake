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
	    @order_items = @order.order_items.all
	end
	def update
	    @order = Order.find(params[:id])
        if @order.update(order_params)
           redirect_to admin_order_path(@order)
        else
        render "show"
        end
	end

	private
    def order_params
    params.require(:order).permit(:status)
    end
end
