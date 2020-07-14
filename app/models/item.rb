class Item < ApplicationRecord
	validates :name, presence: true
	validates :price, presence: true

	belongs_to :genre, optional: true
	has_many :cart_items, dependent: :destroy

	attachment :image

	enum sales_status:{
		売り切れ: false,
		販売中: true
	}, _suffix: true

	def Item.search(search, select)
        if select == "2"
          Item.where(['name LIKE ?', "%#{search}%"])
        else
          Item.all
        end
    end
end
