class Inventory::Ppr::Release::Attach < ActiveRecord::Base

  attr_accessible :asset, :ppr_id, :release_id, :image

  belongs_to :release, :class_name => 'Inventory::Ppr::Release'

  #validates :asset, :presence => true

  mount_uploader :image, PprAttachUploader


end
