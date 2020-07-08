class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.boolean :is_deleted
      t.string :last_name_kana
      t.string :first_name_kana
      t.text :address
      t.string :last_name_kanji
      t.string :first_name_kanji
      t.string :postal_code
      t.string :tel

      t.timestamps
    end
  end
end
