class Api::Streets::HousesController < Api::Streets::ApplicationController

  def index
    @street = current_street

    query = params[:address][:value] ? params[:address][:value].strip : ''

    params[:search] = {:street_id_equals => @street.id, :number_contains => query} || {}
    @search = ::Street::House.metasearch params[:search]
    @houses = @search

  end

end