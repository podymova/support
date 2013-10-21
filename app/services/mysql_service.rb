class MysqlService < BaseService
  require 'mysql'

  attr_accessor :connect

  def initialize(attr)
    @@connect = ::Mysql.connect(attr[:host], attr[:dbuser], attr[:dbpassword], attr[:dbname])
  end


  def close
    @@connect.close
  end

end