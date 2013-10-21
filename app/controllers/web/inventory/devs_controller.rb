class Web::Inventory::DevsController < Web::Inventory::ApplicationController



  def index
    params[:search] = {:meta_sort => 'id.desc'}.merge(params[:search] || {})
    query = params[:search]
    @search = ::Inventory::Tdev::Dev.metasearch query
    @devs = @search.page(params[:page]).per(per_page)

    @mid = getModelId('devs')

    add_breadcrumb I18n.t('web.admin.devs.title'), :devs_path
  end






  def edit
    @mid = getModelId('devs')
    @dev = ::Inventory::Tdev::Dev.find(params[:id])

    add_breadcrumb I18n.t('web.admin.devs.title'), :devs_path
    add_breadcrumb @dev.model, params[:from_url]
  end






  def show
    @mid = getModelId('devs')
    @dev = ::Inventory::Tdev::Dev.find(params[:id])

    add_breadcrumb I18n.t('web.admin.devs.title'), :devs_path
    add_breadcrumb @dev.model, params[:from_url]
  end






  def new
     @user = current_user
     @dev = @user.dev.build
     @dev.order = ::Inventory::Tdev::Dev.maximum('order').to_i+1

     add_breadcrumb I18n.t('web.admin.devs.title'), :devs_path
  end






  def create
     @dev = ::Inventory::Tdev::Dev.new(params[:inventory_tdev_dev])
       if @dev.save
         flash[:notice] = t('web.created')
         redirect_to edit_dev_path(@dev)
       else
         flash[:error] = flash_translate(@dev.errors.full_messages)
         render :action => :new
    end
  end






  def update
    @dev = ::Inventory::Tdev::Dev.find(params[:id])

    if @dev.update_attributes(params[:inventory_tdev_dev])
      flash[:notice] = t('web.updated')
      redirect_to edit_dev_path(@dev)
    else
      flash[:error] = flash_translate(@dev.errors.full_messages)
      render :action => :edit
    end

  end




end
