class CreateVendorsFruits < ActiveRecord::Migration[6.1]
  def change
    create_table :vendors_fruits do |t|
      t.integer :fruit_id
      t.integer :vendor_id
      t.float :price, default: 0.00
      t.integer :quantity, default: 0
      t.timestamps
    end
    add_index :vendors_fruits, :fruit_id
    add_index :vendors_fruits, :vendor_id
  end
end
