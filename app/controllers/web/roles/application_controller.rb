class Web::Roles::ApplicationController < Web::ApplicationController

  private

  def current_role
    current_role = ::Role.find(params[:role_id])
  end

end