class Api::Inventory::TdevsController < Api::Inventory::ApplicationController

  def search
    #raise params.inspect
    #params[:search] = {:tcabel_id_equals => params[:id]}.merge(params[:search] || {})
    query = params[:search]  || {}
    @search = ::Inventory::Tdev::Dev.metasearch query
    @cabels = @search.page(params[:page]).per(per_page)
  end

end