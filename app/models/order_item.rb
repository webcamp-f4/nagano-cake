class OrderItem < ApplicationRecord
	belongs_to :order

	enum making_status: [:着手不可, :製作待ち, :製作中, :製作完了]

	def total_price
		price * amount
	end
end
