class Order < ApplicationRecord
	belongs_to :customer
	has_many :order_items

	enum status: [:入金待ち, :入金確認, :製作中, :発送準備中, :発送済み]

	enum pay_method:{
		クレジットカード: 0,
		銀行振り込み: 1
	}, _suffix: true

	validates :pay_method, presence: true
	validates :shipping_address, presence: true
end
