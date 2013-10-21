class AddMastercompIdToStreetHouses < ActiveRecord::Migration
  def change
    add_column :street_houses, :mastercomp_id, :integer
  end
end
