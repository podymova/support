class Role::User < ActiveRecord::Base

  include GeneralRepository
  include UserRepository

  require 'digest/md5'

  attr_accessible :role_id, :email, :fullname, :login, :password, :phone, :state, :type,
                  :state_event, :password_digest, :password_new, :password_confirmation, :admin


  belongs_to :role
  has_many :ppr, :class_name => 'Inventory::Ppr'
  has_one :release, :class_name => 'Inventory::Ppr::Release'
  has_many :dev, :class_name => 'Inventory::Tdev::Dev'
  has_many :tdev, :class_name => 'Inventory::Tdev'
  has_many :cabel, :class_name => 'Inventory::Tcabel::Cabel'
  has_many :tcabel, :class_name => 'Inventory::Tcabel'
  has_many :dmoving, :class_name => 'Inventory::Dmoving'
  has_many :node, :class_name => 'Inventory::Node'
  has_many :mastercomp, :class_name => 'Inventory::Mastercomp'
  #has_many :role
  #has_many :bug, :class_name => 'Root::Bug'



  validates :login, :presence => true, :uniqueness => true
  validates :password, :presence => true, :confirmation => true

  def self.authenticate(login, password)
    user = find_by_login(login)
    if user && user.password == ::Digest::MD5.hexdigest(password)
      user
    else
      nil
    end
  end


  def generate_password
    self.password = SecureApp.generate_password
  end


  state_machine :state, :initial => :active do
#    event :email_confirmation_sended do
#      transition all - :waiting_email_confirmation => :waiting_email_confirmation
#    end

#    event :confirm do
#      transition :waiting_email_confirmation => :active
#    end

    event :block do
      transition all - :blocked => :blocked
    end

    event :activate do
      transition all - :active => :active
    end
  end

  def to_s
    fullname
  end

end
