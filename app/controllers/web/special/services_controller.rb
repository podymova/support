class Web::Special::ServicesController < Web::Special::ApplicationController

  def index


    add_breadcrumb 'Service', :special_services_path
  end

end