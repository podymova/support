class Web::Inventory::MastercompsController < Web::Inventory::ApplicationController

  add_breadcrumb I18n.t('web.admin.mastercomps.title'), :mastercomps_path

  def index
    query = params[:search] || {}
    @search = ::Inventory::Mastercomp.metasearch query
    @mastercomps = @search
  end

  def edit
    @mastercomp = ::Inventory::Mastercomp.find(params[:id])
  end

  def create
     @mastercomp = ::Inventory::Mastercomp.new(params[:inventory_mastercomp])
       if @mastercomp.save
         flash[:notice] = t('web.created')
         redirect_to edit_mastercomp_path(@mastercomp)
       else
         flash[:error] = flash_translate(@mastercomp.errors.full_messages)
         render :action => :new
    end
  end

  def new
     @user = current_user
     @mastercomp = @user.mastercomp.build
     @mastercomp.order = ::Inventory::Mastercomp.maximum('order').to_i+1
  end

  def update
    @mastercomp = ::Inventory::Mastercomp.find(params[:id])

    if @mastercomp.update_attributes(params[:inventory_mastercomp])
      flash[:notice] = t('web.updated')
      redirect_to edit_mastercomp_path(@mastercomp)
    else
      flash[:error] = flash_translate(@mastercomp.errors.full_messages)
      render :action => :edit
    end
  end

end
