class CreateTransportationGuides < ActiveRecord::Migration[6.1]
  def change
    create_table :transportation_guides do |t|
      t.string :country_origin
      t.string :country_destination
      t.datetime :hour_departure
      t.datetime :hour_arrival
      t.string :timezone
      t.timestamps
    end
  end
end
