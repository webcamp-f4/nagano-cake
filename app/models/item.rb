class Item < ApplicationRecord
	validates :name, presence: true
	validates :price, presence: true

	belongs_to :genre
	has_many :cart_items, dependent: :destroy
	has_many :order_items, dependent: :destroy

	attachment :profile_image
end
