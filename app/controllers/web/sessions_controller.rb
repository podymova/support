class Web::SessionsController < ApplicationController

  def new

  end

  def create
    user = ::Role::User.authenticate(params[:session][:login], params[:session][:password])
    if user
      sign_in(user)
      flash[:info] =  t('web.sessions.logged_in')
      redirect_to root_path
    else
      flash[:error] = t('web.sessions.login_failed')
      render :action => :new
    end
  end

  def destroy
    sign_out
    flash[:info] = t('web.sessions.logged_out')
    redirect_to root_path
  end

end