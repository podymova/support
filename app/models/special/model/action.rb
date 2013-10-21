class Special::Model::Action < ActiveRecord::Base
  attr_accessible :full, :model_id, :name, :order, :state, :state_event

  belongs_to :model, :class_name => 'Special::Model'

  validates :name, :presence => true
  validates :full, :presence => true

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
