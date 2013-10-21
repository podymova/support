class Web::Inventory::Tdevs::DevsController < Web::Inventory::Tdevs::ApplicationController

  add_breadcrumb I18n.t('web.admin.devs.title'), :devs_path

  def edit
    @tdev = current_tdev
    @tdev_dev = ::Inventory::Tdev::Dev.find(params[:id])

    add_breadcrumb @tdev_dev.inumber, '#'
  end

  def create
     @tdev = current_tdev
     @tdev_dev = @tdev.devs.build(params[:inventory_tdev_dev])
       if @tdev_dev.save
         #flash[:notice] = t('web.created')
       else
         flash[:error] = flash_translate(@tdev_dev.errors.full_messages)
       end
     redirect_to params[:from_url]
  end

  def update
    @tdev_dev = ::Inventory::Tdev::Dev.find(params[:id])

    if @tdev_dev.update_attributes(params[:inventory_tdev_dev])
      flash[:notice] = t('web.updated')
      redirect_to params[:from_url]
    else
      flash[:error] = flash_translate(@tdev_dev.errors.full_messages)
      render :action => :edit
    end
  end

end
