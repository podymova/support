class UserChangePasswordType < Role::User
  extend BaseType

  require 'digest/md5'

  attr_accessible :password, :password_confirmation

  validates :password, :presence => true, :confirmation => true

  before_save :encrypt_password

  def encrypt_password
    #if pwd.present?
      self.password = ::Digest::MD5.hexdigest(password)
    #end
  end
end