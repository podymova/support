class Web::Inventory::Pprs::Releases::UsersController < Web::Inventory::Pprs::Releases::ApplicationController
  def create
    @release = current_release

    @user = @release.users.build(params[:inventory_ppr_release_user])
    unless @user.save
      flash[:error] = flash_translate(@user.errors.full_messages)
    end
    redirect_to params[:from_url]
  end

  def destroy
    @ppr_user = ::Inventory::Ppr::Release::User.find(params[:id])
    @ppr_user.destroy
    redirect_to params[:from_url]
  end
end
