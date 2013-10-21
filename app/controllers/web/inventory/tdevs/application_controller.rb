class Web::Inventory::Tdevs::ApplicationController < Web::Inventory::ApplicationController

  private

  def current_tdev
    current_tdev = ::Inventory::Tdev.find(params[:tdev_id])
  end

end