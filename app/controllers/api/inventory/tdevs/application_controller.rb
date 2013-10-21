class Api::Inventory::Tdevs::ApplicationController < Api::Inventory::ApplicationController

  def current_tdev
    @current_tdev = ::Inventory::Tdev.find(params[:tdev_id])
  end

end