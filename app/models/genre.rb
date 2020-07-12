class Genre < ApplicationRecord
	has_many :items, dependent: :destroy

	after_update do
		if valid_status == false
			self.items.each {|item|
				item.update(sales_status: "販売不可")
			}
		end
	end
end
