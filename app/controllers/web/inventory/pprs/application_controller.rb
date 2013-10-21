class Web::Inventory::Pprs::ApplicationController < Web::Inventory::ApplicationController

  private

  def current_ppr
    current_ppr = ::Inventory::Ppr.find(params[:ppr_id])
  end

end