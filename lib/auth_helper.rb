module AuthHelper

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session[:user_id] = nil
  end

  def signed_in?
    session[:user_id] && ::Role::User.find(session[:user_id])
  end
  
  def current_user
    @current_user ||= (session[:user_id] && ::Role::User.find(session[:user_id]))
  end

  def current_type
    @current_type = current_user.role.type.classify.constantize
  end

  def parents
    @parents = (current_type == ::Root) ? [] : [current_type.superclass, current_type]
  end

  def current_menu
    @current_menu = {}
    @user = current_user
    @user.role.rights.active.each_with_index do |r|
      @current_menu[r.model.id] = {:id => r.model.id,
                                   :title => r.model.full,
                                   :controller => r.model.name,
                                   :open => ((r.aedit == true) ? 'edit' : 'show'),
                                   :new => r.aedit,
                                   :delete => r.adelete}
    end

    return @current_menu
  end

  def authenticate_user!
    #raise params.inspect
    unless signed_in?
      redirect_to new_session_path(:from_url => request.fullpath)
    end
  end

#  def authenticate_admin!
#    unless current_user && current_menu && current_user.admin?
#      redirect_to new_session_path(:from_url => request.fullpath)
#    end
#  end

  def sign_in_by_token
    if params[:auth_token].present?
      token = ::Role::User::AuthToken.find_by_authentication_token!(params[:auth_token])
      user = token.user
      sign_in user
    end
  end

  def from_url
    params[:from_url] || root_url
  end


end
