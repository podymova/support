class Web::Admin::Streets::ApplicationController < Web::Admin::ApplicationController

  add_breadcrumb I18n.t('web.admin.streets.title'), :admin_streets_url
  add_breadcrumb I18n.t('web.admin.houses.title'), :admin_street_houses_url

  private

  def current_street
    current_street = ::Street.find(params[:street_id])
  end

end