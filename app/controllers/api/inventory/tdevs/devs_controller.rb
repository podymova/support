class Api::Inventory::Tdevs::DevsController < Api::Inventory::Tdevs::ApplicationController

  def search
    #params[:search] = {:tcabel_id_equals => params[:id]}.merge(params[:search] || {})
    @tdev = current_tdev
    params[:search] = {:tdev_id_equals => @tdev.id, :meta_sort => 'id.desc'}.merge(params[:search] || {})
    query = params[:search]  #|| {}
    @search = ::Inventory::Tdev::Dev.metasearch query
    @devs = @search.page(params[:page]).per(per_page)

    @mid = getModelId('devs')

    respond_with @devs.to_json
  end

end