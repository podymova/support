class Web::ApplicationController < ApplicationController


  add_breadcrumb I18n.t('web.admin.main'), :root_path

  layout "application_main"

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