class Web::Inventory::PprsController < Web::Inventory::ApplicationController

  add_breadcrumb I18n.t('web.admin.pprs.title'), :pprs_path

  def index
    query = params[:search] || {}
    @search = ::Inventory::Ppr.metasearch query
    @pprs = @search.page(params[:page]).per(30)
  end

  def new
    @user = current_user
    @ppr = @user.ppr.build
  end

  def edit
    @ppr = ::Inventory::Ppr.find(params[:id])


    add_breadcrumb @ppr.full_address, :edit_ppr_path
  end

  def create
         @user = current_user
         @ppr = @user.ppr.build({:street_id => params[:inventory_ppr][:street_id], :house_id => params[:inventory_ppr][:house_id]})

           ::Inventory::Hardware.active.asc_by_order.each {|h|  @ppr.hards.build({:hardware_id => h.id}) }
           @ppr.hards.each do |h|
               ::Inventory::Hardware::Topology.active.asc_by_order.find_all_by_hardware_id(h.hardware_id).each do |t|
                   h.tops.build({:topology_id => t.id, :value => ''})
               end
           end
         if @ppr.save
            flash[:notice] = t('web.created')
            redirect_to edit_ppr_path(@ppr)
         else
            flash[:error] = flash_translate(@ppr.errors.full_messages)
            render :action => :new
         end
  end

  def update
    @ppr = ::Inventory::Ppr.find(params[:id])
    if @ppr.update_attributes(params[:inventory_ppr])
      flash[:notice] = t('web.updated')
      redirect_to(edit_ppr_path(@ppr))
    else
      flash[:error] = flash_translate(@ppr.errors.full_messages)
      render :action => :edit      
    end
  end

  def destroy
    @ppr = ::Inventory::Ppr.find(params[:id])
    @ppr.destroy
    redirect_to pprs_path
  end

end
