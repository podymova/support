class Group::Section < ActiveRecord::Base

  include SectionRepository

  attr_accessible :name, :section, :group_id

  belongs_to :group

end
