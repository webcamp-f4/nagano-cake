class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :pay_method
      t.integer :total_due
      t.integer :postage
      t.integer :status
      t.string :shipping_name
      t.string :shipping_postal_code
      t.text :shipping_address

      t.timestamps
    end
  end
end
