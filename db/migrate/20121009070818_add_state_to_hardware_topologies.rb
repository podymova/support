class AddStateToHardwareTopologies < ActiveRecord::Migration
  def change
    add_column :hardware_topologies, :state, :string
  end
end
