class Inventory::Ppr::Release < ActiveRecord::Base

  attr_accessible :date2end,
                  :date2ispoln,
                  :manager,
                  :ppr_id,
                  :resume,
                  :tasks_list,
                  :user_id,
                  :created_at,
                  :hards_attributes

  belongs_to :ppr, :class_name => 'Inventory::Ppr'
  belongs_to :user, :class_name => 'Role::User'

  has_many :hards, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :users, :dependent => :destroy
  has_many :attaches, :dependent => :destroy

  accepts_nested_attributes_for :hards, :allow_destroy => true

  #validates :date2ispoln, :presence => true, :if => :check_date1, :on => :update
  #validates :date2end, :presence => true, :if => :check_date2, :on => :update
  validates :resume, :length => { :minimum => 0, :maximum => 1000}

  #before_update :check_date1, :check_date2

  def check_date1
      self.errors.add(:date2ispoln, :date2ispoln1) if DateTime.parse(self.date2ispoln.to_s) < DateTime.parse(self.created_at.to_s)
  end

  def check_date2
      self.errors.add(:date2end, :date2end1) if DateTime.parse(self.date2end.to_s) < DateTime.parse(self.date2ispoln.to_s)
  end


end
