class Web::PasswordsController < Web::ApplicationController

  def edit
    @user = ::Role::User.find(params[:id])
  end

  def update
    @password = ::UserChangePasswordType.find(params[:id])

    if @password.update_attributes(params[:role_user])
      flash[:notice] = t('web.admin.users.profile')
      redirect_to params[:from_url]
    else
      flash[:error] = flash_translate(@password.errors.full_messages)
      render 'edit'
    end
  end

end