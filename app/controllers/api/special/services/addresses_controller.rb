class Api::Special::Services::AddressesController < Api::Special::Services::ApplicationController


  def update
     @provider = provider

     gateway = @provider.class_name.classify.constantize

     counter1 = 0
     counter2 = 0
     gateway.streets.each do |row|
       @street = ::Street.new
       @street.short = row[0]
       @street.name = row[1]

         if @street.save
              gateway.houses(@street.short).each do |j|
                  @house = @street.houses.build({:number => j[1], :entrances => j[2], :floors => j[3]})

                  if @house.save
                    counter2 += 1
                  end
              end
              counter1 += 1
         end

     end

     #service = ::Special::Service.new
     #service.dictionary =

     @result = "#{counter1} street(s) were inserted.\r\n #{counter2} house(s) were inserted."

     respond_with @result #, :location => nil
  end





  def index
     ::Street.all.each do |i|
        i.destroy
     end

     ::Street::House.all.each do |i|
        i.destroy
     end

    @result = "The addresses dictionary was cleared out."
  end


end