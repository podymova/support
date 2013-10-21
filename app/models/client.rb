class Client < Admin
  include GeneralRepository
  include UserRepository

  #has_many :client, :dependent => :destroy, :class_name => 'Role::User'
end