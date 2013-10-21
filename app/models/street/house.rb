class Street::House < ActiveRecord::Base
  attr_accessible :entrances, :floors, :number, :st_short, :street_id, :state, :state_event

  belongs_to :street
  belongs_to :mastercomp

  has_one :ppr

  has_many :ppr, :through => :street

  validates :number, :presence => true
  validates :street_id, :presence => true

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
  scope :house_filter, lambda { |street,value|
      where('street_id = :street AND number ILIKE :value', :street => "#{street}", :value => "%#{value}%")
    }

  def to_s
    number
  end

  def self.get_house(house)
    house = find_by_id(house)
    if house
      house.number
    else
      nil
    end
  end



end
