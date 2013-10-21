class Web::Inventory::CabelsController < Web::Inventory::ApplicationController

  add_breadcrumb I18n.t('web.admin.cabels.title'), :cabels_path

  def index
    query = params[:search] || {}
    @search = ::Inventory::Tcabel::Cabel.metasearch query
    @cabels = @search
  end

  def edit
    @cabel = ::Inventory::Tcabel::Cabel.find(params[:id])
  end

  def create
     @user = current_user
     @cabel = @user.cabel.build(params[:inventory_tcabel_cabel])
       if @cabel.save
         flash[:notice] = t('web.created')
         redirect_to edit_cabel_path(@cabel)
       else
         flash[:error] = flash_translate(@cabel.errors.full_messages)
         render :action => :new
    end
  end

  def new
     @cabel = ::Inventory::Tcabel::Cabel.new
     @cabel.order = ::Inventory::Tcabel::Cabel.maximum('order').to_i+1
  end

  def update
    @cabel = ::Inventory::Tcabel::Cabel.find(params[:id])

    if @cabel.update_attributes(params[:inventory_tcabel_cabel])
      flash[:notice] = t('web.updated')
    else
      flash[:error] = flash_translate(@cabel.errors.full_messages)
    end
    render :action => :edit
  end

end
