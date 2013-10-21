class Role < ActiveRecord::Base
  include UserRepository

  attr_accessible :name, :order, :state, :user_id, :state_event, :rights_attributes, :type

  #belongs_to :user
  has_many :rights, :dependent => :destroy
  has_many :users

  accepts_nested_attributes_for :rights, :allow_destroy => true

  validates :name, :presence => true, :uniqueness => true
  validates :type, :presence => true


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

    scope :general_role, where("name ILIKE 'General' ")

end
