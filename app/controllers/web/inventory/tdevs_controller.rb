class Web::Inventory::TdevsController < Web::Inventory::ApplicationController


    def index
    query = params[:search] || {}
    @search = ::Inventory::Tdev.metasearch query
    @tdevs = @search.page(params[:page]).per(per_page)

    @mid = params[:mid].to_i

    add_breadcrumb I18n.t('web.admin.tdevs.title'), tdevs_path(:mid => @mid)
  end





  def edit
    @mid = params[:mid].to_i
    @tdev = ::Inventory::Tdev.find(params[:id])

    add_breadcrumb I18n.t('web.admin.tdevs.title'), tdevs_path(:mid => @mid)
    add_breadcrumb @tdev.model, params[:from_url]
  end





  def show
    @mid = params[:mid].to_i
    @tdev = ::Inventory::Tdev.find(params[:id])

    add_breadcrumb I18n.t('web.admin.tdevs.title'), tdevs_path(:mid => @mid)
    add_breadcrumb @tdev.model, params[:from_url]
  end





  def new
     @mid = params[:mid].to_i
     @user = current_user
     @tdev = @user.tdev.build
     @tdev.order = ::Inventory::Tdev.maximum('order').to_i+1

     add_breadcrumb I18n.t('web.admin.tdevs.title'), tdevs_path(:mid => @mid)
  end






  def create
     @mid = params[:mid].to_i
     @tdev = ::Inventory::Tdev.new(params[:inventory_tdev])
       if @tdev.save
         flash[:notice] = t('web.created')
         redirect_to edit_tdev_path(@tdev, :mid => @mid)
       else
         flash[:error] = flash_translate(@tdev.errors.full_messages)
         render :action => :new
    end
  end






  def update
    @mid = params[:mid].to_i
    @tdev = ::Inventory::Tdev.find(params[:id])

    if @tdev.update_attributes(params[:inventory_tdev])
      flash[:notice] = t('web.updated')
    else
      flash[:error] = flash_translate(@tdev.errors.full_messages)
    end
    redirect_to edit_tdev_path(@tdev, :mid => @mid)
  end


end