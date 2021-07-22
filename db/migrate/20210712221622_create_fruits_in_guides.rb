class CreateFruitsInGuides < ActiveRecord::Migration[6.1]
  def change
    create_table :fruits_in_guides do |t|
      t.integer :transportation_guide_id
      t.integer :fruit_id
      t.integer :quantity, default: 0
      t.timestamps
    end
    add_index :fruits_in_guides, :transportation_guide_id
    add_index :fruits_in_guides, :fruit_id
  end
end
