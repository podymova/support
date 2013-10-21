class AddStreetIdToNodes < ActiveRecord::Migration
  def change
    add_column :nodes, :street_id, :integer
  end
end
