class SupportService < MysqlService
  #class << self

    def initialize
      attr = {
            :host => 'localhost',
            :dbname => 'support',
            :dbuser => 'root',
            :dbpassword => '1q2w3e4r'
      }
      ::MysqlService.new(attr)
    end

    def streets
      puts @@connect
    end

  #end
end