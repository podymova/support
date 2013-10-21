class Inventory::Ppr::Release::Top < ActiveRecord::Base
  attr_accessible :hard_id, :topology_id, :value, :release_id

  belongs_to :hard
  belongs_to :topology, :class_name => 'Hardware::Topology'

end
