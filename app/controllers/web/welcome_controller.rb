class Web::WelcomeController < Web::ApplicationController
  def show
    if current_user.role.name == 'General' && current_type == ::Client
      flash[:info] = "You didn't enter into any group. Call the admin to estimate permissions politics."
    end
  end
end