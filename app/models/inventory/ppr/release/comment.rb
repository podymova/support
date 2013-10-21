class Inventory::Ppr::Release::Comment < ActiveRecord::Base
 attr_accessible :ppr_id, :body, :release_id

 belongs_to :release, :class_name => 'Inventory::Ppr::Release'
 
 validates :body, :presence => true, :length => { :minimum => 0, :maximum => 300}

end
