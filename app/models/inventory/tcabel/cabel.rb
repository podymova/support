class Inventory::Tcabel::Cabel < ActiveRecord::Base
   attr_accessible :inumber, :length, :comment, :state, :order, :tcabel_id, :user_id, :state_event

  belongs_to :user
  belongs_to :tcabel, :class_name => 'Inventory::Tcabel'

  has_many :nodes

  validates :inumber, :presence => true, :uniqueness => true
  validates :tcabel_id, :presence => true
  validates :comment, :length => { :minimum => 0, :maximum => 1000}

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

  def to_s
    inumber
  end


end
