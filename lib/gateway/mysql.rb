class Gateway::Mysql
  class << self
    require 'mysql'

    attr_accessor :connect

    def new(attr)
      @@connect = ::Mysql.connect(attr[:host], attr[:dbuser], attr[:dbpassword], attr[:dbname])
    end


    def close
      @@connect.close
    end
  end
end