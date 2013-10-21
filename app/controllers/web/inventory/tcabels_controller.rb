class Web::Inventory::TcabelsController < Web::Inventory::ApplicationController

  add_breadcrumb I18n.t('web.inventory.tcabels.title'), :tcabels_path

  def index
    query = params[:search] || {}
    @search = ::Inventory::Tcabel.metasearch query
    @tcabels = @search.page(params[:page]).per(per_page)

    @mid = getModelId('tcabels')
  end

  def edit
    @mid = getModelId('tcabels')
    @tcabel = ::Inventory::Tcabel.find(params[:id])

    #query = params[:search] || {}
    #@search = ::Inventory::Tcabel::Cabel.metasearch query
    #@cabels = @search.page(params[:page]).per(per_page)

    add_breadcrumb @tcabel.name, params[:from_url]
  end

  def show
    @mid = getModelId('tcabels')
    @tcabel = ::Inventory::Tcabel.find(params[:id])

    #query = params[:search] || {}
    #@search = ::Inventory::Tcabel::Cabel.metasearch query
    #@cabels = @search.page(params[:page]).per(per_page)

    add_breadcrumb @tcabel.name, params[:from_url]
  end

  def create
     @user = current_user
     @tcabel = @user.tcabel.build(params[:inventory_tcabel])
       if @tcabel.save
         flash[:notice] = t('web.created')
         redirect_to edit_tcabel_path(@tcabel)
       else
         flash[:error] = flash_translate(@tcabel.errors.full_messages)
         render :action => :new
    end
  end

  def new
     @tcabel = ::Inventory::Tcabel.new
     @tcabel.order = ::Inventory::Tcabel.maximum('order').to_i+1
  end

  def update
    @tcabel = ::Inventory::Tcabel.find(params[:id])

    if @tcabel.update_attributes(params[:inventory_tcabel])
      flash[:notice] = t('web.updated')
      #render :action => :edit
      redirect_to edit_tcabel_path(@tcabel)
    else
      flash[:error] = flash_translate(@tcabel.errors.full_messages)
      render :action => :new
    end
  end



end
