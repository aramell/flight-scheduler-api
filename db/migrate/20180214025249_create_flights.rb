class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|  
      t.integer :time
      t.datetime :date
      t.string :planeNumber
      t.integer :plane_id
      t.string :squawks
      t.string :pilot
      t.string :flightTime
      t.string :destination
      t.integer :likes, default: 0

      t.timestamps
    end
  end
end
