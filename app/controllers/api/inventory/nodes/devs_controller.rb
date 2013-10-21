class Api::Inventory::Nodes::DevsController < Api::Inventory::Nodes::ApplicationController

  def search
    @node = current_node
    params[:search] = {:node_id_equals => @node.id, :meta_sort => 'id.desc'}.merge(params[:search] || {})
    query = params[:search]  #|| {}
    @search = ::Inventory::Node::Dev.metasearch query
    @devs = @search.page(params[:page]).per(per_page)

    @mid = getModelId('nodes')

    respond_with @devs.to_json
  end

end