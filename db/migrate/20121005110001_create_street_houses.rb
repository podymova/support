class CreateStreetHouses < ActiveRecord::Migration
  def change
    create_table :street_houses do |t|
      t.string :st_short
      t.integer :street_id
      t.string :number
      t.integer :entrances
      t.integer :floors

      t.timestamps
    end
  end
end
