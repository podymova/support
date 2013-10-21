class Web::Inventory::Tcabels::CabelsController < Web::Inventory::Tcabels::ApplicationController

  add_breadcrumb I18n.t('web.inventory.cabels.title'), :cabels_path

  def edit
    @tcabel = current_tcabel
    @tcabel_cabel = ::Inventory::Tcabel::Cabel.find(params[:id])

    add_breadcrumb @tcabel_cabel.inumber, :tcabels_path
  end

  def create
     @tcabel = current_tcabel
     @tcabel_cabel = @tcabel.cabels.build(params[:inventory_tcabel_cabel])
       if @tcabel_cabel.save
          flash[:notice] = t('web.created')
       else
          flash[:error] = flash_translate(@tcabel_cabel.errors.full_messages)
       end
       redirect_to params[:from_url]
  end

  def update
    @tcabel_cabel = ::Inventory::Tcabel::Cabel.find(params[:id])

    if @tcabel_cabel.update_attributes(params[:inventory_tcabel_cabel])
      flash[:notice] = t('web.updated')
      redirect_to params[:from_url]
    else
      flash[:error] = flash_translate(@tcabel_cabel.errors.full_messages)
      render :action => :edit
    end
  end

end