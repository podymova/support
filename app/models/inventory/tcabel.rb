class Inventory::Tcabel < ActiveRecord::Base
  attr_accessible :name, :prefix, :order, :state_event, :user_id

  belongs_to :user
  has_many :cabels

  validates :name, :presence => true, :uniqueness => true
  validates :prefix, :presence => true
  validates :name, :presence => true, :uniqueness => true, :on => :back

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