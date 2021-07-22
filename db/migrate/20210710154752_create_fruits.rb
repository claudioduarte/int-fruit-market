class CreateFruits < ActiveRecord::Migration[6.1]
  def change
    create_table :fruits do |t|
      t.string :name
      t.string :image_url
      t.text :description
      t.timestamps
    end
  end
end
