class Inventory::Ppr::Release::Hard < ActiveRecord::Base
  attr_accessible :ppr_id, :hardware_id, :tops_attributes, :release_id

  belongs_to :release, :class_name => 'Inventory::Ppr::Release'
  belongs_to :hardware, :class_name => 'Hardware'
  has_many :tops, :dependent => :destroy

  accepts_nested_attributes_for :tops, :allow_destroy => true

end
