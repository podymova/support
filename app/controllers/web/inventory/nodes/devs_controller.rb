class Web::Inventory::Nodes::DevsController < Web::Inventory::Nodes::ApplicationController
  def create
    @node = current_node
    params.each_key do |i|
      if i.slice('item')
        @node = current_node
        @dev = @node.devs.build(:dev_id => params["#{i}"])
        @dev.save
     end
    end
    redirect_to edit_node_path(@node)
  end

  def destroy
    @node_dev = ::Inventory::Node::Dev.find(params[:id])
    @node_dev.destroy
    redirect_to params[:from_url]
  end
end
