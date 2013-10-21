class Web::Inventory::NodesController < Web::Inventory::ApplicationController

  def index
    params[:search] = {:meta_sort => 'id.desc'}.merge(params[:search] || {})
    query = params[:search]
    @search = ::Inventory::Node.metasearch query
    @nodes = @search.page(params[:page]).per(per_page)

    @mid = getModelId('nodes')

    add_breadcrumb I18n.t('web.admin.nodes.title'), :nodes_path
  end






  def new
     @user = current_user
     @node = @user.node.build
     @node.order = ::Inventory::Node.maximum('order').to_i+1

     add_breadcrumb I18n.t('web.admin.nodes.title'), :nodes_path
  end






  def edit
    @mid = getModelId('nodes')
    @node = ::Inventory::Node.find(params[:id])

    title = @node.street.name + '-' + @node.house.number.to_s + '-' + @node.entrance.to_s
    add_breadcrumb I18n.t('web.admin.nodes.title'), :nodes_path
    add_breadcrumb title, params[:from_url]
  end





  def show
    @mid = getModelId('nodes')
    @node = ::Inventory::Node.find(params[:id])

    title = @node.street.name + '-' + @node.house.number.to_s + '-' + @node.entrance.to_s
    add_breadcrumb I18n.t('web.admin.nodes.title'), :nodes_path
    add_breadcrumb title, params[:from_url]
  end





  def create
     @node = ::Inventory::Node.new(params[:inventory_node])
       if @node.save
         flash[:notice] = t('web.created')
         redirect_to edit_node_path(@node)
       else
         flash[:error] = flash_translate(@node.errors.full_messages)
         render :action => :new
       end
  end





  def update
    @node = ::Inventory::Node.find(params[:id])

    if @node.update_attributes(params[:inventory_node])
      flash[:notice] = t('web.updated')
      redirect_to edit_node_path(@node)
    else
      flash[:error] = flash_translate(@node.errors.full_messages)
      render :action => :edit
    end
  end


end
