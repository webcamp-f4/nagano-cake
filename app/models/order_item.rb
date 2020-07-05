class OrderItem < ApplicationRecord
	belongs_to :item
	belongs_to :order

	enum making_status:{
		着手不可: 0,
		製作待ち: 1,
		製作中: 2,
		製作完了: 3,
	}, _suffix: true

	def total_price
		price * amount
	end
end
