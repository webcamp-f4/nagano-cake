class HomesController < ApplicationController
	def top
		@random = Item.where(sales_status: "販売中").order("RANDOM()").limit(4)
		@genres = Genre.where(valid_status: true)# ジャンルが有効のみ
	end

	def about
	end
end
