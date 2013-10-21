class Web::Inventory::Pprs::Releases::AttachesController < Web::Inventory::Pprs::Releases::ApplicationController
  def create
    @release = current_release
    @attach = @release.attaches.build(params[:attach])
    unless @attach.save
      flash[:error] = flash_translate(@attach.errors.full_messages)
    end

    redirect_to params[:from_url]
  end

  def destroy
    @ppr_attach = ::Inventory::Ppr::Release::Attach.find(params[:id])
    @ppr_attach.destroy
    redirect_to params[:from_url]
  end

  def show
    @attach = ::Inventory::Ppr::Attach.find(params[:id])
    send_file "#{Rails.root}/public#{@attach.asset}", :disposition  =>  'attachment'
  end

end