class Genre < ApplicationRecord
	has_many :items, dependent: :destroy


	}, _suffix: true
end
