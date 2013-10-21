class Web::Special::Models::ActionsController < Web::Special::Models::ApplicationController

  add_breadcrumb 'Actions', '#'

  def edit
    @model = current_model
    @model_action = ::Special::Model::Action.find(params[:id])

    add_breadcrumb @model_action.name, '#'
  end

  def create
     @model = current_model
     @model_action = @model.actions.build(params[:special_model_action])
       if @model_action.save
         flash[:notice] = t('web.created')
       else
         flash[:error] = flash_translate(@model_action.errors.full_messages)
       end
     redirect_to params[:from_url]
  end

  def update
    @model_action = ::Special::Model::Action.find(params[:id])

    if @model_action.update_attributes(params[:special_model_action])
      flash[:notice] = t('web.updated')
      redirect_to params[:from_url]
    else
      flash[:error] = flash_translate(@model_action.errors.full_messages)
      render :action => :edit
    end
  end

  def destroy
    @action = ::Special::Model::Action.find(params[:id])
    if @action.destroy
       flash[:success] = 'The row has been deleted.'
    end
    redirect_to params[:from_url]
  end

end
