class ChangeShippingNameOrders < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :orders, :shipping_name, false, ""
  	change_column :orders, :shipping_name, :string, default: ""
  end
end
