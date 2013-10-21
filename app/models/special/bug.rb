class Special::Bug < ActiveRecord::Base
  attr_accessible :body, :responce, :state, :subject, :user_id

  #has_many :actions, :class_name => 'Root::Model::Action'
  #belongs_to :user

  validates :subject, :presence => true
  validates :body, :presence => true

  state_machine :state, :initial => :new do
    event :fix do
      transition all - :fixed => :fixed
    end

    #event :activate do
    #  transition all - :active => :active
    #end
  end

    #scope :new, where(:state => :new)
    #scope :fixed, where(:state => :fixed)
end
