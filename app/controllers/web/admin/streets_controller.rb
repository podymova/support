class Web::Admin::StreetsController < Web::Admin::ApplicationController

  add_breadcrumb I18n.t('web.admin.streets.title'), :admin_streets_url

  def index

    @title = t('web.admin.streets.title')
    @streets = ::Street.page(params[:page]).per(settings.per_page)
  end

  def new
     @street = ::Street.new
     #@street_house = @street.houses.build
  end

  def edit
    @street = ::Street.find(params[:id])
    #@street_house = @street.houses.build(:st_short => @street.short)
    #raise @house.inspect
  end

  def create
     @street = ::Street.new(params[:street])
       if @street.save
         flash[:notice] = t('web.created')
         render :action => :edit
       else
         render :action => :new
    end
  end
                                                                                    
  def update
    @street = ::Street.find(params[:id])

    if @street.update_attributes(params[:street])
      flash[:notice] = t('web.updated')
      redirect_to :action => :index
    else
      render 'edit'
    end
  end

  def destroy
    @street = ::Street.find(params[:id])
    @street.destroy
    redirect_to :action => :index
  end


end