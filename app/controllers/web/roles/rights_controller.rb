class Web::Roles::RightsController < Web::Roles::ApplicationController

  def index
    @role = current_role
    @role_rights = @role.rights
  end

  def edit
    @tcabel = current_tcabel
    @tcabel_cabel = ::Tcabel::Cabel.find(params[:id])
  end

  def create

  end

  def update
    #raise params.inspect
    @tcabel_cabel = ::Tcabel::Cabel.find(params[:id])

    if @tcabel_cabel.update_attributes(params[:tcabel_cabel])
      flash[:notice] = t('web.updated')
      redirect_to params[:from_url]
    else
      flash[:error] = flash_translate(@tcabel_cabel.errors.full_messages)
      render :action => :edit
    end
  end


end
