class Inventory::Hardware::Topology < ActiveRecord::Base

  include GeneralRepository

  attr_accessible :name, :hardware_id, :order, :state, :state_event

  belongs_to :hardware, :class_name => 'Inventory::Hardware'
  has_one :top, :class_name => 'Inventory::Ppr::Top'

  validates :name, :presence => true

  state_machine :state, :initial => :active do
    event :block do
      transition all - :blocked => :blocked
    end

    event :activate do
      transition all - :active => :active
    end
  end

    scope :active, where(:state => :active)
    scope :blocked, where(:state => :blocked)

end
