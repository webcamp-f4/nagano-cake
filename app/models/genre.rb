class Genre < ApplicationRecord
	has_many :items, dependent: :destroy

	enum valid_status:{
		無効: false,
		有効: true
	}, _suffix: true
end
