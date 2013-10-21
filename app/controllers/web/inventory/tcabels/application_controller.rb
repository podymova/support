class Web::Inventory::Tcabels::ApplicationController < Web::Inventory::ApplicationController

  private

  def current_tcabel
    current_tcabel = ::Inventory::Tcabel.find(params[:tcabel_id])
  end

end