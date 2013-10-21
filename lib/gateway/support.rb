class Gateway::Support < Gateway::Mysql
  class << self

    def new
      attr = {
            :host => 'localhost',
            :dbname => 'support',
            :dbuser => 'root',
            :dbpassword => '1q2w3e4r'
      }
      Gateway::Mysql.new(attr)
    end




    def streets
      self.new

      @streets = @@connect.query("select * from streets")

      @@connect.close

      return @streets

    end



    def houses street
      self.new

      @houses = @@connect.query("SELECT * FROM houses WHERE street = '#{street}'")

      @@connect.close

      return @houses

    end



  end
end