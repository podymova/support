class AddStateToStreetHouses < ActiveRecord::Migration
  def change
    add_column :street_houses, :state, :string
  end
end
