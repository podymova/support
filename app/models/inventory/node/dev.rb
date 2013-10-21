class Inventory::Node::Dev < ActiveRecord::Base
  attr_accessible :dev_id, :node_id

  belongs_to :node
  belongs_to :dev, :class_name => 'Tdev::Dev'

  validates :dev_id, :presence => true, :uniqueness => true
end
