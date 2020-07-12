class ChangePostageOrders < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :orders, :postage, false, 800
  	change_column :orders, :postage, :integer, default: 800
  end
end
