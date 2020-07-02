class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.integer :item_id
      t.integer :making_status
      t.integer :amount
      t.integer :price

      t.timestamps
    end
  end
end
