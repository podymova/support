class Special::Model < ActiveRecord::Base
  attr_accessible :name, :order, :section, :state, :state_event, :full

  has_many :actions, :class_name => 'Special::Model::Action'

  validates :name, :presence => true, :uniqueness => true
  validates :section, :presence => true

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
    scope :sections, select(:section).group(:section)
    scope :getId, lambda{|value| select(:id).where("name ILIKE :value AND state = 'active'", :value => "%#{value}%")}
end
