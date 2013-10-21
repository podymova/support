class Api::Streets::ApplicationController < Api::ApplicationController

  def current_street
    @current_street = ::Street.find_by_id(params[:street_id])
  end

end