class AddOrderToHardwareTopologies < ActiveRecord::Migration
  def change
    add_column :hardware_topologies, :order, :integer
  end
end
