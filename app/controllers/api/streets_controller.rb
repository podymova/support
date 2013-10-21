class Api::StreetsController < Api::ApplicationController

  def index
    query = params[:address][:value] ? params[:address][:value].strip : ''

    params[:search] = {:short_or_name_contains => query} || {}
    @search = ::Street.metasearch params[:search]
    @streets = @search

  end



  def show
    #raise params.inspect
    street = params[:id]
    house = params[:house]

    result = []
    result <<  ::Street.find(street).name unless nil
    result << ::Street::House.find(house).number unless nil

    respond_with result, :location => nil
  end

end