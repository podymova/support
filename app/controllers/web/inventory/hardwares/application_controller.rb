class Web::Inventory::Hardwares::ApplicationController < Web::Inventory::ApplicationController

  add_breadcrumb I18n.t('web.admin.hardwares.title'), :hardwares_path
  add_breadcrumb I18n.t('web.admin.topologies.title'), :hardware_topologies_path

  private

  def current_hardware
    current_hardware = ::Inventory::Hardware.find(params[:hardware_id])
  end

end