class Web::Inventory::HardwaresController < Web::Inventory::ApplicationController

  add_breadcrumb I18n.t('web.admin.hardwares.title'), :hardwares_path

  def index
    @title = t('web.admin.hardwares.title')
    @hardwares = ::Inventory::Hardware.all
     #.order(:id).page(params[:page]).per(settings.per_page)
  end

  def edit
    @hardware = Inventory::Hardware.find(params[:id])
  end

  def create
     @hardware = Inventory::Hardware.new(params[:inventory_hardware])
       if @hardware.save
         flash[:notice] = t('web.created')
         render :action => :edit
       else
         flash[:error] = flash_translate(@hardware.errors.full_messages)
         render :action => :new
    end
  end

  def new
     @hardware = Inventory::Hardware.new
     @hardware.order = Inventory::Hardware.maximum('order').to_i+1
  end

  def update
    @hardware = Inventory::Hardware.find(params[:id])

    if @hardware.update_attributes(params[:inventory_hardware])
      flash[:notice] = t('web.updated')
      redirect_to :action => :index
    else
      flash[:error] = flash_translate(@hardware.errors.full_messages)
      render :action => :edit
    end
  end

  def destroy
    @hardware = Inventory::Hardware.find(params[:id])
    @hardware.destroy
    redirect_to :action => :index
  end

end
