class Api::ApplicationController < ApplicationController
   respond_to :json

  before_filter :authenticate_user!, :set_locale, :base_title

  helper_method :signed_in?,
                :title,
                :from_url,
                :current_user,
                :current_type,
                :parents,
                :current_menu,
                :roles_inaccessible,
                :general_role_id,
                :types

end