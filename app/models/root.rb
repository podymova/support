class Root < Role
  include GeneralRepository
  include UserRepository

  #attr_accessible :type_state

  has_many :admin, :class_name => 'Role'
  has_many :client, :class_name => 'Role'

end