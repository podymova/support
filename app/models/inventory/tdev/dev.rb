class Inventory::Tdev::Dev < ActiveRecord::Base
   include GeneralRepository

   attr_accessible :tdev_id,
                   :inumber,
                   :snumber,
                   :ip,
                   :mac,
                   :state,
                   :state_event,
                   :user_id,
                   :order,
                   :producer,
                   :model,
                   :power


  belongs_to :user
  belongs_to :tdev
  has_one :dev, :class_name => 'Node::Dev'

  validates :producer, :model, :presence => true
  validates :model, :uniqueness => true

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
