class Admin::SearchesController < ApplicationController
	def search
		@select = params[:option]
		if @select == "1"
			@customers = Customer.search(params[:search], @select)
		elsif @select == "2"
			@items = Item.search(params[:search], @select)
		else
			@order = Order.search(params[:search], @select)
		end
	end
end
