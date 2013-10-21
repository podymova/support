class Web::Inventory::Pprs::Releases::HardsController < Web::Inventory::Pprs::Releases::ApplicationController
   def index
     @ppr = current_ppr
     @hards = @ppr.hards
     #@ppr.hards.build
     #@tabs = @ppr.hardwares.find(:all, :select => 'distinct hardware_id')

     #raise @tabs.inspect
   end

   def new
         #@user = current_user
         @ppr = current_ppr
         #@ppr =  @user.ppr.build({:street_id => params[:inventory_ppr][:street_id], :house_id => params[:inventory_ppr][:house_id]})

           ::Inventory::Hardware.active.asc_by_order.each {|h|  @ppr.hards.build({:hardware_id => h.id}) }
           @ppr.hards.each do |h|
               ::Inventory::Hardware::Topology.active.asc_by_order.find_all_by_hardware_id(h.hardware_id).each do |t|
                   h.tops.build({:topology_id => t.id, :value => ''})
               end
           end
           #raise @ppr.hards.inspect
     redirect_to edit_ppr_path(@ppr)
   end

end