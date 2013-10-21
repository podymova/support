class Api::Inventory::Nodes::ApplicationController < Api::Inventory::ApplicationController

  def current_node
    @current_node = ::Inventory::Node.find(params[:node_id])
  end

end