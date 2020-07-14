class ChangeIsDeletedCustomers < ActiveRecord::Migration[5.2]
  def change
  	change_column_null :customers, :is_deleted, false, true
  	change_column :customers, :is_deleted, :boolean, default: true
  end
end
