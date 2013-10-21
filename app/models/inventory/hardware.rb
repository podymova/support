class Inventory::Hardware < ActiveRecord::Base

  include GeneralRepository

  attr_accessible :name, :state, :state_event, :order

  has_many :topologies #, :class_name => 'Inventory::Hardware::Topology'
  has_one :hard, :class_name => 'Inventory::Ppr::Hard'

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