class Web::Roles::UsersController < Web::Roles::ApplicationController

  #
  # Adding to the role
  #
  def create
    params.each_key do |i|
      if i.slice('item')
        @user = ::Role::User.find(params["#{i}"])
        @user.update_attributes(:role_id => params[:role_id])
      end
    end
    redirect_to params[:from_url]
  end


  #
  # Removing from the role
  #
  def destroy
   @user = ::Role::User.find(params[:id])
   role = ::Role.find_by_name('General')
   @user.update_attributes(:role_id => role.id)
   #raise @user.inspect
   redirect_to params[:from_url]
  end

end
