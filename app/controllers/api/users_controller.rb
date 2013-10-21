class Api::UsersController < Api::ApplicationController

  def index
    #raise params.inspect
    search = params[:search1][:text] || ""
    params[:search1] = {:login_or_fullname_or_email_like => search} || {}

    #, :email_like => search,   :fullname_like => search

    query = params[:search1]
    @search = ::Role::User.metasearch query
    @users = @search

    #raise @users.inspect
    respond_with @user
    #params[:search_users] = {:meta_sort => 'id.asc'}.merge(params[:search_users] || {})
    #query = params[:search_users]  #|| {}
    #@search = ::Role::User.active.metasearch query
    #@users = @search
    ##.page(params[:page]).per(10)

    #@d = 'Hello'
    #respond_with @d.to_json
  end

  def search
    #raise params.inspect
    search = params[:search1][:text] || ""
    params[:search1] = {:login_like => search} || {}

    #, :email_like => search,   :fullname_like => search
    #.other_roles(params[:role_id])
    query = params[:search1]
    @search = ::Role::User.metasearch query
    @users = @search

    respond_with @user.to_json
  end


  #def edit
  #  @user = ::Role::User.find(params[:param])
  #  respond_with @user, :location => edit_api_user_path(@user)
  #end


end