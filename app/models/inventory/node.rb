class Inventory::Node < ActiveRecord::Base
  attr_accessible :street_id, # Street
                  :house_id,  # House
                  :order,
                  :mvlan,
                  :cvlan,
                  :state_event,
                  :service_state,
                  :quantity,
                  :item,
                  :entrance,
                  :comment,
                  :inumber # Important, №Site

  belongs_to :user
  belongs_to :street, :class_name => 'Street'
  belongs_to :house, :class_name => 'Street::House'

  belongs_to :dev, :class_name => 'Tdev::Dev'
  belongs_to :cabel, :class_name => 'Tcabel::Cabel'

  has_many :devs, :dependent => :destroy


  #validates :inumber, :presence => true, :uniqueness => true
  validates :order, :presence => true, :uniqueness => true

  #validates :street_id, :presence => true
  #validates :house_id, :presence => true
  #validates :cabel_id, :presence => true
  #validates :devs, :presence => true

  state_machine :state, :initial => :active do
    event :block do
      transition all - :blocked => :blocked
    end

    event :activate do
      transition all - :active => :active
    end
  end


  state_machine :service_state, :initial => :not_examined do

    event :prepare_to_examination do
      transition all - :ready_to_examination => :ready_to_examination
    end

    event :examination do
      transition all - :examined => :examined
    end

    event :build do
      transition all - :building => :building
    end

    event :mount do
      transition all - :mounting => :mounting
    end

    event :unmount do
      transition all - :unmounted => :unmounted
    end

    event :service do
      transition all - :on_service => :on_service
    end

  end

    scope :active, where(:state => :active)
    scope :blocked, where(:state => :blocked)

    scope :on_service, where(:service_state => :on_service)
    scope :not_examined, where(:service_state => :not_examined)
    scope :ready_to_examination, where(:service_state => :ready_to_examination)
    scope :examined, where(:service_state => :examined)
    scope :building, where(:service_state => :building)
    scope :unmounted, where(:service_state => :unmounted)
    scope :mounting, where(:service_state => :mounting)

  def to_s
    inumber
  end

end
