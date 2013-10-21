class Admin < Root
  include GeneralRepository
  include UserRepository

  #attr_accessible :type_state

  has_many :client, :class_name => 'Role'



end