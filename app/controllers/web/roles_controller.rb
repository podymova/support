class Web::RolesController < Web::ApplicationController

  add_breadcrumb I18n.t('web.admin.roles.title'), :roles_url

  def index
    params[:search] = {:type_not_in => parents, :meta_sort => 'asc.id'}.merge(params[:search] || {})
    query = params[:search] # || {}
    @search = ::Role.metasearch query
    @roles = @search.page(params[:page]).per(per_page)
  end


  def new
     #@type = current_user.role.type.classify.constantize
     @role = ::Role.new(:type => 'Client')
     @role.order = ::Role.maximum('order').to_i+1

     add_breadcrumb '', params[:from_url]
  end

  def show
     @role = ::Role.find(params[:id])

    params[:search] = {:role_id_equals => @role.id, :meta_sort => 'asc.id'}.merge(params[:search] || {})
    query = params[:search]
    @search = ::Role::User.metasearch query
    @role_users = @search.page(params[:page]).per(per_page)

    add_breadcrumb @role.name, params[:from_url]
  end


  def edit
    @role = ::Role.find(params[:id])

    params[:search] = {:role_id_equals => @role.id, :meta_sort => 'asc.id'}.merge(params[:search] || {})
    query = params[:search]
    @search = ::Role::User.metasearch query
    @role_users = @search.page(params[:page]).per(per_page)

    add_breadcrumb @role.name, params[:from_url]
  end

  def create
     @role = ::Role.new(params[:role])

       if @role.save

          ::Special::Model.active.each do |m|
             @role.rights.build({:model_id => m.id,
                                 :ashow => false,
                                 :aedit => false,
                                 :adelete => false })
          end
          @role.save

         #flash[:notice] = t('web.created')
         redirect_to edit_role_path(@role)
       else
         flash[:error] = flash_translate(@role.errors.full_messages)
         render :action => :new
       end
  end

  def update

    @role = ::Role.find(params[:id])

    if @role.update_attributes(params[@role.class.name.downcase!])
      flash[:notice] = t('web.updated')
      redirect_to :action => :index
    else
      flash[:error] = flash_translate(@role.errors.full_messages)
      render :action => :edit
    end
  end

  def destroy
    @role = ::Role.find(params[:id])
    @role.destroy
    redirect_to :action => :index
  end

end
