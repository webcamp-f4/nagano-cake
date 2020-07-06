class CartItem < ApplicationRecord
	belongs_to :item
	belongs_to :customer

	def total_price
		price * amount
	end
end
