class Web::Special::ModelsController < Web::Special::ApplicationController

  add_breadcrumb 'Models', :special_models_path

  def index
    query = params[:search] || {}
    @search = ::Special::Model.metasearch query
    @models = @search
  end

  def edit
    @model = ::Special::Model.find(params[:id])

    add_breadcrumb @model.name, params[:from_url]
  end

  def create
     @model = ::Special::Model.new(params[:special_model])
       if @model.save

          ::Role.active.each do |r|
             r.rights.build({:model_id => @model.id,
                                 :ashow => false,
                                 :aedit => false,
                                 :adelete => false })
             r.save
          end


         flash[:notice] = t('web.created')
         redirect_to edit_special_model_path(@model)
       else
         flash[:error] = flash_translate(@model.errors.full_messages)
         render :action => :new
    end
  end

  def new
     @model = ::Special::Model.new
     @model.order = ::Special::Model.maximum('order').to_i+1
  end

  def update
    @model = ::Special::Model.find(params[:id])

    if @model.update_attributes(params[:special_model])
      flash[:notice] = t('web.updated')
      redirect_to special_models_path
    else
      flash[:error] = flash_translate(@model.errors.full_messages)
      render :action => :new
    end
  end

  def destroy
    @model = ::Special::Model.find(params[:id])
    if @model.destroy
       flash[:success] = 'The row has been deleted.'
    end
    redirect_to special_models_path
  end


end
