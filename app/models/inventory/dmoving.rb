class Inventory::Dmoving < ActiveRecord::Base
  attr_accessible :dev_id, :nod_from, :nod_to, :comment, :user_id

  belongs_to :user
  belongs_to :dev, :class_name => 'Tdev::Dev'

  validates :dev_id, :presence => true  #, :uniqueness => true
  validates :nod_from, :presence => true
  validates :nod_to, :presence => true

end