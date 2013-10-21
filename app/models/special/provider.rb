class Special::Provider < ActiveRecord::Base

  attr_accessible :attr,
                  :class_name,
                  :name,
                  :state
end