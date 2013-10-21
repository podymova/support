class Inventory::Mastercomp < ActiveRecord::Base
  attr_accessible :name, :street_id, :house_id, :flat_id, :user_id, :state, :order, :state_event

  belongs_to :user
  belongs_to :street, :class_name => 'Street'
  belongs_to :house, :class_name => 'Street::House'
  #belongs_to :flat, :class_name => 'Street::House::Flat'

  validates :name, :presence => true, :uniqueness => true
  validates :street_id, :presence => true
  validates :house_id, :presence => true

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
