class Web::Inventory::Pprs::ReleasesController < Web::Inventory::Pprs::ApplicationController

   add_breadcrumb I18n.t('web.admin.pprs.title'), :pprs_path

   def index
     @ppr = current_ppr
     @releases = @ppr.releases
   end

   def new
     @ppr = current_ppr
     @release = @ppr.releases.build({:user_id => current_user.id, :created_at => Time.now})

     ::Inventory::Hardware.active.asc_by_order.each {|h|  @release.hards.build({:hardware_id => h.id}) }
     @release.hards.each do |h|
         ::Inventory::Hardware::Topology.active.asc_by_order.find_all_by_hardware_id(h.hardware_id).each do |t|
             h.tops.build({:topology_id => t.id, :value => ''})
         end
     end

     @release.save
     redirect_to edit_ppr_release_path(@ppr, @release, :from_url => request.fullpath, :new => true)


     add_breadcrumb @ppr.full_address, edit_ppr_path(@ppr)
   end

   def edit
     @ppr = current_ppr
     @release = ::Inventory::Ppr::Release.find(params[:id])

     add_breadcrumb @ppr.full_address, edit_ppr_path(@ppr)
     add_breadcrumb @release.created_at, :edit_ppr_release_path
   end

   def create
     @ppr = current_ppr
     @release = @ppr.releases.build(params[:inventory_ppr_release])
     if @release.save
       redirect_to params[:from_url]
     else
       flash[:error] = flash_translate(@release.errors.full_messages)
       render :action => :new
     end
   end

  def update
    @release = ::Inventory::Ppr::Release.find(params[:id])
    if @release.update_attributes(params[:inventory_ppr_release])
      flash[:notice] = t('web.updated')
      redirect_to params[:from_url]
    else
      flash[:error] = flash_translate(@release.errors.full_messages)
      render :action => :edit
    end
  end

   def destroy
     @release = ::Inventory::Ppr::Release.find(params[:id])
     @release.destroy
     #flash[:success] = 'The row has been deleted succesfully.'
     redirect_to params[:from_url]
   end


   def get_doc1
     @doc = params[:name]
     @ppr = ::Inventory::Ppr.find(params[:ppr_id])
     @release = ::Inventory::Ppr::Release.find(params[:release_id])


      file = File.read("#{Rails.root}/public/template/ppr_1.xml")
      xml = ::Nokogiri::XML(file)


      path = "#{Rails.root}/public/reports/#{Time.now.usec}.xml"
      File.open(path, "w") do |f|
        f.write xml.to_xml.sub('ADDRESS',"#{@ppr.street.name}, #{@ppr.house.number}").sub('DAY',"#{@release.created_at.day}").sub('MONTH',"#{@release.created_at.month}").sub('YEAR',"#{@release.created_at.year}").sub('MANAGER',"#{::Role::User.find(@release.manager).fullname}")
      end

      send_file path, :type => 'application/msword'

   end


end