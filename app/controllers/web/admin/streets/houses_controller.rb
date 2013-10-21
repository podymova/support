class Web::Admin::Streets::HousesController < Web::Admin::Streets::ApplicationController

  def edit
    @street = current_street
    @street_house = ::Street::House.find(params[:id])
  end

  def create
     @street = current_street
     @street_house = @street.houses.build(params[:street_house])
       if @street_house.save
         flash[:notice] = t('web.created')
         redirect_to params[:from_url]
       else
         flash[:notice] = 'Some error'
    end
  end

  def update
    @street_house = ::Street::House.find(params[:id])

    if @street_house.update_attributes(params[:street_house])
      flash[:notice] = t('web.updated')
      redirect_to params[:from_url]
    else
      render :action => :edit
    end

  end

  def destroy
    #raise params[:id].inspect
    @house = ::Street::House.find(params[:id])
    @house.destroy
    redirect_to params[:from_url]
  end

end