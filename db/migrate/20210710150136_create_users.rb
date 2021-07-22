class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.string :remember_token
      t.boolean :admin, default: false
      t.integer :vendor_id

      t.timestamps
    end
    add_index :users, :email
    add_index :users, :remember_token
    add_index :users, :vendor_id
  end
end
