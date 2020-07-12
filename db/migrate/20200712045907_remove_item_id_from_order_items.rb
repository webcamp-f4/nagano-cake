class RemoveItemIdFromOrderItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_items, :item_id, :integer
  end
end
