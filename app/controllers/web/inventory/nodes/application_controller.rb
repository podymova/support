class Web::Inventory::Nodes::ApplicationController < Web::Inventory::ApplicationController

  private

  def current_node
    current_node = ::Inventory::Node.find(params[:node_id])
  end

end