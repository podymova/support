class Inventory::Ppr::Release::User < ActiveRecord::Base
  attr_accessible :ppr_id, :user_id, :release_id

  belongs_to :release, :class_name => 'Inventory::Ppr::Release'
  belongs_to :user, :class_name => 'Role::User'
  
  validates :user_id, :presence => true, :uniqueness => true

  #def check_ispoln_presence
  #  self.errors.add(:user_id, 'You are not ispoln') if DateTime.parse(self.date_to_end.to_s) < DateTime.parse(self.date_to_inspoln.to_s)
  #end

end
