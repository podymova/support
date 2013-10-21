class Web::Inventory::DmovingsController < Web::Inventory::ApplicationController

  add_breadcrumb I18n.t('web.admin.dmoving.title'), :dmovings_url

  def index
    query = params[:search] || {}
    @search = ::Inventory::Dmoving.metasearch query
    @dmovings = @search
  end

  def new
     @user = current_user
     @dmoving = @user.dmoving.build
  end

  def edit
    @dmoving = ::Inventory::Dmoving.find(params[:id])
  end

  def create
     @dmoving = ::Inventory::Dmoving.new(params[:inventory_dmoving])
       if @dmoving.save
         flash[:notice] = t('web.created')
         redirect_to dmovings_path
       else
         flash[:error] = flash_translate(@dmoving.errors.full_messages)
         render :action => :new
    end
  end

  def update
    @dmoving = ::Inventory::Dmoving.find(params[:id])

    if @dmoving.update_attributes(params[:inventory_dmoving])
      flash[:notice] = t('web.updated')
      redirect_to dmovings_path
    else
      flash[:error] = flash_translate(@dmoving.errors.full_messages)
      render :action => :edit
    end
  end

  def destroy
    @dmoving = ::Inventory::Dmoving.find(params[:id])
    @dmoving.destroy
    redirect_to demovings_path
  end

end
