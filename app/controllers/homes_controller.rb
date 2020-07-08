class HomesController < ApplicationController
	def top
		@random = Item.where(sales_status: "販売中").order("RANDOM()").limit(4)
	end

	def about
	end
end
