class Inventory::Ppr < ActiveRecord::Base

  include GeneralRepository
  include PprRepository

  attr_accessible :entrance, :floor, :house_id, :street_id

                   #, :user_id, :hards_attributes, :manager, :resume, :tasks_list, :date_to_inspoln, :date_to_end, :created_at

  belongs_to :user #, :class_name => 'Role::User'
  belongs_to :street
  belongs_to :house, :class_name => 'Street::House'

  has_many :releases, :dependent => :destroy




  #accepts_nested_attributes_for :attaches, :allow_destroy => true
  #accepts_nested_attributes_for :comments, :allow_destroy => true
  
  validates :entrance, :presence => true, :numericality => true, :on => :update
  validates :street_id, :presence => true
  validates :house_id, :presence => true
  #validates :floor, :numericality => true


  def full_address
    "#{street.name} - #{house.number}"
  end

  
end
