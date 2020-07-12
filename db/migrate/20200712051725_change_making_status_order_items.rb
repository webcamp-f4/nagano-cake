class ChangeMakingStatusOrderItems < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :order_items, :making_status, false, 0
  	change_column :order_items, :making_status, :integer, default: 0
  end
end
