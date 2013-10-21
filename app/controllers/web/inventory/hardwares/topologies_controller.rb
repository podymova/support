class Web::Inventory::Hardwares::TopologiesController < Web::Inventory::Hardwares::ApplicationController

  def index
    @title = t('web.admin.topologies.title')
    @hardware = current_hardware
    @hardware_topologies = @hardware.topologies.order(:name)
    #.page(params[:page]).per(settings.per_page)
  end

  def new
     @hardware = current_hardware
     @hardware_topology = ::Inventory::Hardware::Topology.new
  end

  def edit
    @hardware = current_hardware
    @hardware_topology = ::Inventory::Hardware::Topology.find(params[:id])
  end

  def create
     @hardware = current_hardware
     @hardware_topology = @hardware.topologies.build(params[:inventory_hardware_topology])

       if @hardware_topology.save
         flash[:notice] = t('web.created')
         redirect_to params[:from_url]
       else
         flash[:error] = flash_translate(@hardware_topology.errors.full_messages)
         render :action => :new
    end
  end

  def update
    @hardware_topology = ::Inventory::Hardware::Topology.find(params[:id])

    if @hardware_topology.update_attributes(params[:inventory_hardware_topology])
      flash[:notice] = t('web.updated')
      redirect_to params[:from_url]
    else
      flash[:error] = flash_translate(@hardware_topology.errors.full_messages)
      render :action => :edit
    end
  end

  def destroy
    @hardware_topology = ::Inventory::Hardware::Topology.find(params[:id])
    @hardware_topology.destroy
    redirect_to :action => :index
  end

end