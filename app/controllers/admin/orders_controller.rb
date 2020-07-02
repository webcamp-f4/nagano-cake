class Admin::OrdersController < ApplicationController
	def today	
		@order = Oreder.all
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
	end
	def update		
	end
end
