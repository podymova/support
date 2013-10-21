class Web::UsersController < Web::ApplicationController

  add_breadcrumb I18n.t('web.admin.users.title'), :roles_url

  def index
    params[:search_users] = {:meta_sort => 'asc.id'}.merge(params[:search_users] || {})
    query = params[:search]
    @search = ::Role::User.active.metasearch query
    @users = @search.page(params[:page]).per(per_page)
  end

  def new
    @user = ::Role::User.new

    add_breadcrumb '', params[:from_url]
  end

  def edit
    @user = ::Role::User.find(params[:id])

    add_breadcrumb @user.fullname, params[:from_url]
  end

  def create
     @user = ::Role::User.new(params[:role_user])
     @user.generate_password
       if @user.save
         redirect_to roles_path
       else
         flash[:error] = flash_translate(@user.errors.full_messages)
         render 'new'
       end
  end

  def update
    mess = params[:message] || ''
    @user = ::Role::User.find(params[:id])

      if @user.update_attributes(params[:role_user])
        unless mess.empty?
          flash[:success] = mess
        end
        redirect_to params[:from_url]
      else
        flash[:error] = flash_translate(@user.errors.full_messages)
        render 'edit'
      end
  end

  def destroy
    @user = ::Role::User.find(params[:id])
    @user.destroy
    redirect_to params[:from_url]
  end


end