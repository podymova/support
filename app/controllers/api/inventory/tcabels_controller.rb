class Api::Inventory::TcabelsController < Api::Inventory::ApplicationController

  def search
    #raise params.inspect
    #params[:search] = {:tcabel_id_equals => params[:id]}.merge(params[:search] || {})
    query = params[:search]  || {}
    @search = ::Inventory::Tcabel::Cabel.metasearch query
    @cabels = @search.page(params[:page]).per(per_page)
  end

end