class Inventory::Tdev < ActiveRecord::Base
 include GeneralRepository

 attr_accessible :model, :order, :state, :state_event, :user_id

  belongs_to :user
  has_many :devs

  validates :model, :presence => true

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
    model
  end

end
