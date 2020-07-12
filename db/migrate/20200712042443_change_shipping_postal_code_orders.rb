class ChangeShippingPostalCodeOrders < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :orders, :shipping_postal_code, false, ""
  	change_column :orders, :shipping_postal_code, :string, default: ""
  end
end
